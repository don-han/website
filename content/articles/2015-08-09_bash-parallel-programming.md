Title: [how-to] Bash Parallel Programming
Slug: bash-parallel-programming
Date: 2015-08-09

Parallel programming basically means writing scripts that can process multiple
tasks at the same. This is in contrast to running scripts in a serial order which requires the
previous tasks to be completed before moving onto the next.

Parallelization can be useful for boosting the performance, but it requires the tasks
that are going to be parallelized to be independent of one another. Therefore, in
this tutorial, we will refer to the function `do-something` as a task that can
be safely run in parallel. For didactic purpose, we define `do-something` as follows:

```bash
function do-something(){
    sleep $1
    echo $1
}
```

There are several ways of parallelizing a bash script, and each has its own pros
and cons.

1.

```bash
for i in $(seq 5 1); do
    do-something $i &
done
```

This is the simplest form of parallelization in bash. `&` forks each
`do-something` task to the background every time it's called.

If you run this parallel script, your output should look something like this:

```
1
2
3
4
5
```

Even though our script runs from 5 to 1, `do-something` task with the shortest sleeping time gets finished first.

Also, note the speed improvement. Our serial script runs in `5+4+3+2+1=15`
seconds while our parallel should theoretically run in 5 seconds. That's 3 times performance improvement by just attaching `&`!

However, there is one critical problem. Imagine, instead of looping through 5 iterations, your script has to loop through 5000 iterations, and your `do-something` does something far more intensive. Then, your `&` can easily overload the server. Our next method serves to prevent that.

ADVATAGE: simple

DISADVANTAGE: can potentially overload the system

2. 

```bash
wait_turn=4
j=1
for i in $(seq 10 1); do
    do-something $i &
    if ((j++ % wait_turn == 0)); then
        wait
    fi
done
wait
echo "after loop"
```

Running this, our result should look something like this:

```
7
8
9
10
3
4
5
6
1
2
after loop
```

Can you see the pattern?

Once our `wait` function is called, the shell "waits" until all background tasks
are finished. In this case, a batch of four tasks are forked into the background at a time as specified by `wait_turn`, and the script waits until all four processes are complete. 

The value of `wait_turn` has been chosen arbitrarily, so you can fiddle with it to find the right number for your own script. Usually, the value is a multiple of the number of the cores you have.

A keen observer might have noted the another `wait` function after the function.
To illustrate its need, consider a similar script without the after-loop `wait`:

```bash
wait_turn=4
j=1
for i in $(seq 10 1); do
    do-something $i &
    if ((j++ % wait_turn == 0)); then
        wait
    fi
done
echo "after loop"
```

Before scrolling down, think what this would output.

```
7
8
9
10
3
4
5
6
after loop
1
2
```

Notice how our "after loop" string comes before `do-something 1` and `do-something 2` is
processed. This could be critical if you have an after-loop code that needs the
for-loop to completely finish. Likewise, apply `wait` fucntion after the for-loop for the first method if necessary.

Yet, even this method can be restrictive. Consider a case where the total time
of task completion varies greatly. For our example above, say every fifth tasks
(`do-something 5`, `do-something 10`), for some odd reason, takes tremendous
amount of time to complete instead of mere 5 or 10 seconds, respectively. If we
run our script again under this new condition, we can see that our script runs
very inefficiently because for our first batch, even though tasks 7, 8, 9 are
already completed, they would have to wait for one task, `do-something 10` to
finish! Likewise, for our second batch, the threads that were working on tasks
3, 4, and 6 are idling because they cannot move forward until `do-something 5`
completes. In other words, if the batch contains an unusually slow task, it becomes
the bottle neck and slows down the entire process, almost defeating the purpose
of parallelism.

ADVANTAGE: parallelization without overloading the system

DISADVANTAGE: bottlenecks occur and can potentially slow down the entire process

3.

Fortunately, UNIX/LINUX comes with a command called
[`xargs`](https://en.wikipedia.org/wiki/Xargs) which whips idling tasks back to
work. . `xargs` is not specifically designed to be used for parallelization, but
it comes with a handy `-P` flag which defines the maximum number of processes that can run at
a time. `xargs` is extremely flexible, so I will not go into too much details in
this article, but I will cover the basics.

For example,

```bash
seq 10 1 | xargs -n1 -P4 -I {} bash -c "sleep {}; echo {};"
```

To break it down, I give the input ranging from 10 to 1. Then, `xargs` separates
the input into indiviual pieces (as specified by -n1, meaning take at most one
argument). The big `-P` flag as mentioned is what gives the parallelization
ability. Without it, the `xargs` runs the command in a serial manner. After we
set the variable to `{}`, `-I` replaces all ocurrences of `{}` in the command
with the input chunk, which in our case are individual numbers. Finally, `xargs`
runs the bash, which, in turn, executes the string with all `{}` replaced with
input chunks.


The above snippet produces:

```
7
8
9
10
5
4
3
6
1
2
```

As we have seen with #2, since we have limited to the four processes, only upto 4 tasks are processed at a time. However, if you take a look at the second batch, you will see that the numbers are not ordered as before. This is because `xargs` assigns tasks as soon as processes becomes available.

Indeed, if we give as many processes as there are inputs, all processes will be handled at the same time as we would expect.

```bash
seq 10 1 | xargs -n1 -P10 -I {} bash -c "sleep {}; echo {};"
```

which rightly produces

```
1
2
3
4
5
6
7
8
9
10
```

`xargs` should be sufficient for most users under most usage cases. Other than the fact that it's a tad bit more complicated than the first two methods I introduced above, `xargs` provides an efficient, easy way of implementing a parallel script.

ADVANTAGE: eliminates bottleneck

DISADVANTAGE: none for most users. See #4 for more

4. 

However, for some users, they might need something more powerful, in which case,
I introduce you [GNU Parallel](http://www.gnu.org/software/parallel/).
Thankfully, GNU parallel already detailed
[reasons why you might want to switch over](https://www.gnu.org/software/parallel/man.html#DIFFERENCES-BETWEEN-xargs-AND-GNU-Parallel).
