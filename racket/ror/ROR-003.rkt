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
In Racket pieces of data are the basic building blocks of meaning. There are ma-
ny sorts of data in Racket, including symbols, numbers, strings, and lists. Here
we'll show the basic building blocks, or data types, that you'll use in Racket.

Booleans
--------
Booleans are one of Racket's simple data forms. They represent answers to yes/no
questions. So:

  > (zero? 1)
  #f

  > (zero? (sub1 1))
  #t

Symbols
-------
Symbols are another common type of data in Racket.A symbol is a stand-alone word
preceded by a single quote ('). Racket symbols are typically made up of letters,
numbers, and characters such as + - / * = < > ? ! _ ^.
Some examples of valid Racket symbols are 'foo, 'ice9, 'my-killer-app27, etc.
Symbols in Racket are case sensitive, but most Racketeers use uppercase sparing-
ly.

  > (symbol=? 'foo 'FoO)
  #f

Numbers
-------
Racket supports both floating-point numbers and integers. Also it has rationals,
complex numbers, and a lot more. The presence of a decimal point determines whe-
ther your number is seen as a floating-point number or an integer.  Thus, these
two numbers are different: 1  and 1.0

Racket can perform some amazing things:

  > (expt 53 53)
  > (sqrt -1)
  > (* (sqrt -1) (sqrt -1))

When you divide two integers you get a rational number:

  > (/ 4 6)
  2/3

But you will get a different answer if your calculation involves an inexact num-
ber:

  > (/ 4.0 6)
  0.6666666666666666666

Strings
-------
Another basic building block is the string. Although strings are not really that
fundamental to Racket,  any program that communicates with  a human may need the
use of strings, because humans like to communicate with text.

A string is written as a sequence of characters surrounded with ("), double quo-
tes. For example: "tutti frutti". When you ask DrRacket to evaluate a string,the
result is just that string itself. Strings evaluate to themselves.

   > "tutti frutti"
   "tutti frutti"

Strings also come with operations; you can add two strings together:

   > (string-append "tutti" "frutti")
   "tuttifrutti"

The string-append function, like the + function, is generalized to take an arbi-
trary number of arguments:

   > (string-append "tutti" " " "frutti")
   "tutti frutti"

There are other string operations like substring, string-ref, string=?,and more.
NOTE: An easy way to look at something in the Help Desk is to move the cursor to
      a name and press "F1"

4. Lists in Racket
   -----------------------------------------------------------------------------


|#