Title: [intro-to] P vs. NP
Date: 2015-5-30 
Tags: intro-to, theory-of-computer-science

NOTE: The following article is intended as a basic introduction
for the subject, so I have intentionally left out some information that I considered
is out of scope. However, if you are familiar with the subject, and if you think
I presented *factually wrong* statements, I will greatly appreciate an email
with correction. Also, if you are not familiar with the subject and are confused
with my explanation, feel free to send me an email on where you got confused.

I expect you to know: 
- Polynomial time (basically meaning an algorithm runs fast)

---

# What exactly are P and NP? Why do we need them?

In order to understand the P vs. NP problem, we must understand P and NP first. P
and NP rose from the necessity of matheticians and computer scientists to
describe how much resources, such as time, are needed to solve a decision problem.

P problems are a set of decision problems that can be solved in polynomial
time *and* verified in polynomial time. On the other hand, NP problems are
a set of decision problems which can be verified in polynomial time. It is
important to note that NP does *not* stand
for "*not* P" which is a common misunderstanding; NP refers to
"non-deterministic polynomial time." For more information, refer to "Extra Note"
at the end of the article since it may confuse than help to understand the
concept. Rather than NP and P being mutually exclusive, all P problems automatically qualify as NP problems since all P problems satisfy polynomial-time verification *as well as* polynomial-time
solution. Therefore, all P problems are NP problems as well.

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
researchers spend their time. If some problems are inherently difficult to solve
and take unreasonble amount of resources, there is no point for talented
researchers to look for a better algorithm. **Since there cannot be a
polynomial-time solution for some NP problems, researchers would no longer have
to waste their time trying to find faster algorithm for problems in NP.**

---

# Extra Note
NP stands for "non-deterministic polynomial time" and although P does
not have an official abbreviation, it is commonly known as "deterministic
polynomial time".  

To be more technical, NP stands for "non-deterministic polynomial" while P
means "deterministic polynomial." A non-deterministic polynomial problem can be
solved in polynomial time with lucky guesses. Meanwhile, the P problem can 
find a solution in polynomial time without depending on luck. As mentioned
before, since P is in NP if P != NP, P problems can also find polynomial-time
solution with some lucky guesses.
