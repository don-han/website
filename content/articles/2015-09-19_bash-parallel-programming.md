Title: [HOW-TO] Bash Parallel Programming
Slug: bash-parallel-programming
Date: 2015-09-19

Parallel programming basically means writing scripts that can process multiple
tasks at the same. This is in contrast to running scripts in a serial order which requires the
previous tasks to be completed before moving onto the next.

Parallelization can be used to boost the performance, but it requires the tasks
that are going to be parallelized be independent of one another. Therefore, in
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

This is the simplest form of parallelization in bash. & forks each
`do-something` task to the background everytime it's called.

If you run the script, your output should look something like this:

```
1
2
3
4
5
```

Even though our script runs from 5 to 1, `do-something` task with the shortest sleeping time gets finished first.

Also, note the speed improvement. Our serial script runs in `5+4+3+2+1=15`
seconds while our parallel should theoretically run in 5 seconds. That's 3 times performance improvement by just attaching &!

However, there is one critical problem. Imagine, instead of looping through 5 iterations, your script has to loop through 5000 iterations, and your `do-something` does something far more intensive. Then, your & can overload the server. Our next method prevents that.

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
are finished. In this case, a batch of four tasks are forked into the background at a time, and the script waits until all the processes are complete. 

The value of wait_turn has been chosen arbitrarily, so you can fiddle with it to find the right number for your own script. 

A keen observer might have noted the another `wait` function after the function.
To illustrate its need, consider a similar script:

```
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

Notice how our after loop comes before `do-something 1` and `do-something 2` is
processed. This could be critical if you have an after-loop code that needs the
for loop to completely finish. Likewise, apply `wait` fucntion after the for loop for the first method if necessary.


[[ MORE ON XARG AND PARALLEL COMING ]]
