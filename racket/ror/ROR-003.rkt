#lang racket
#|

CHAPTER 3 :: BASICS OF RACKET
-----------------------------
In this chapter,  we will show you other kinds of data,  as well as the  general
structure and meaning of Racket programs.

1. Syntax and Semantics
   -----------------------------------------------------------------------------
To understand any language requires two concepts from the field of linguistics:
   * Syntax
   * Semantics
These are fancy words for grammar and meaning.  There is more to a sentence than
just its syntax. We also care about what the sentence actually means.It's usual-
ly possible to express the same semantics with distinct programs written in dif-
ferent programming languages,  because most programming  languages have  similar
semantic powers, syntax is what differs among languages.

2. The Building Blocks of Racket Syntax
   -----------------------------------------------------------------------------
The part of a Racket compiler that reads in the code,  which Racketeers call the
"reader", is simple than, for example a C++ compiler. Take a random piece of Ra-
cket code:

   (define (square n)
     (* n n))

This function definition,which creates a function that squares a number,consists
of nothing more than parentheses and "words". In fact, you can view it as just a
bunch of nested lists.So keep in mind that Racket has only one way of organizing
bits of code: parentheses.
The organization of a program is made completely clear only from the parentheses
it uses. And that's all.

   A Form in Racket:
   -----------------
   ( <funcion> <element> <element> <element> )

In addition to parentheses,  Racket programmers also  use square brackets [] and
curly {}. To keep things  simple, we refer to all of these as "parentheses".  As
long as you match each kind of closing parenthesis to its kind of opening paren-
thesis, Racket will read the code. And as you may have noticed already, DrRacket
is extremely helpful with matching parentheses.

The interchangeability of parentheses comes in handy for making portions of your
code stand out for readers. For example, brackets are often used to group condi-
tionals, while function applications always use parentheses.
In fact, Racketeers have a number of  conventions for where and when  to use the
various kinds of parentheses.  Just read our code carefully, and  you will infer
these conventions on your own.

Comments
--------
There are three kinds of comments:
1. Line comment and it is market using a semicolon ";"
2. The second kind of comment is a block comment,  they start and end with #| |#
3. The third kind of comment is special to Racket and other Lispy languages.  An
   S-expression comment starts with #;  and it tells Racket  to ignore the  next
   parenthesized expressions. In other words, with two keystrokes you can tempo-
   raly delete or enable a large, possibly nested pice of code.


3. The Building Blocks of Racket Semantics
   -----------------------------------------------------------------------------



|#