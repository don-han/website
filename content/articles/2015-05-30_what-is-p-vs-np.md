Title: [IPE] What is P vs. NP?
Date: 2015-5-30 
Tags: in-plain-english

NOTE: The following article is intended for those who have a minimal understanding
of the subject, so I have intentionally left out some information that I considered
is out of scope. However, if you are familiar with the subject, and if you think
I presented *factually wrong* statements, I will greatly appreciate an email
with correction. Also, if you are not familiar with the subject and are confused
with my explanation, feel free to send me an email on where you got confused.

I expect you to know: 
- Polynomial time (algorithm runs fast)

---


In order to understand P vs. NP problem, we must understand P and NP first. P
and NP arose from the necessity of matheticians and computer scientists to
describe how much resources, such as memory or time, a decision problem takes to
be solved. This is a significant task since if some problems are
inherently difficult to solve and take unreasonable amount of resources, there
is no point for talented researchers to look for a better algorithm for those
problems since there will be none by definition. 

# What are P and NP?
   
Formally, NP stands for "nondeterministic polynomial time" and although P does
not have an official abbreviation, it describes a class of problems that can be
solved *and* verified in polynomial time, so it is commonly referred to as the
"polynomial" class. Meanwhile, NP problems are any decision problems that can be
verified in polynomial time. It is important to note that NP does *not* stand
for "*not* P". Rather, all P problems automatically qualify as NP problems since
all P problems satisfy polynomial-time verification *as well as* polynomial-time
solution. Therefore, P and NP are not mutually exclusive.

# P versus NP

Now we can tackle P vs. NP problem, which is currently unsolved. The question
simiply asks if P = NP or not. In other words, the problem asks, if a
problem can be verified in a polynomial time, can the problem find a solution in
a polynomial time? Although the question is simple, the implication
is significant. 

# Implications of P = NP

If P = NP is proven, then this implies that all problems that can be
verified in polynomial time can also be solved in polynomial time as well. The
impact extends beyond academic world since many industrial algorithms including
cryptography are written under the assumption that P != NP.
For example, RSA which are widely used in secured data transmission exploits P != NP by allowing polynomial encryption and
forcing non-polynomial decryption from public key. However if P = NP, then there exists
an algorithm that can decrypt any encrypted information from public key in
polynomial time, and anyone who has found the polynomial-time decryption
algorithm can extract information that is not intended for him/her. **Therefore,
if P = NP, many of the current algorithms that assume P != NP become invalid,
and people can exploit the algorithm for their personal gain at the expense of
others.**

# Implications of P != NP

If P != NP is true, although the impact is not as significant since most of the
academia and industry already assume P != NP, the proof will influence how
researchers spend their time. **Since there cannot be a polynomial-time solution for NP
problems, researchers would no longer have to waste their time trying to find
faster algorithm for problems in NP.

---

# Extra Note

To be more technical, NP stands for "non-deterministic polynomial" while P
means "deterministic polynomial." A non-deterministic polynomial problem can be
solved in polynomial time with lucky guesses. Meanwhile, the P problem can 
find a solution in polynomial time without depending on luck. As mentioned
before, since P is in NP if P != NP, P problems can also find polynomial-time
solution with some lucky guesses.
