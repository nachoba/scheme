#lang racket

#|

1. What Makes Lisp So Cool and Unusual?
   -----------------------------------------------------------------------------
Lisp is a highly expressive language, if Lisp does not have the means to express
the solution to your problem, you change Lisp.

  "Lisp is worth learning for a different reason -the profound enlightment ex-
   perience you will have when you finally get it.  That experience  will make
   you a better programmer for the rest of your days, even if you never actua-
   lly use Lisp itself a lot."
                                                   Eric Raymond

2. Where Did Lisp Come From?
   -----------------------------------------------------------------------------
Lisp is truly ancient, and yet, in some ways,  most existing flavors of Lisp are
more advanced than any other kind of language. The story begins way back in  the
1930s when Alonzo Church devised a new kind of calculus: Lambda Calculus. In his
calculus everything was a function.Then in the late 1950s, John McCarthy, a com-
puter scientist who worked at MIT,came across Church's papers on lambda calculus
and read them.  John's first example was about lists:  lists of ideas, lists  of
tasks, lists of insights, end even lists of programs.
To deal with lists, a program should  provide lists and functions for processing
lists. Because it was so easy to write a Lisp interpreter,many people worte one.
So, soon enough, there wasn't just one Lisp but a lot of Lisps. That is why Lisp
is a family of programming languages, not just a single programming language.

3. What Does Lisp Look Like?
   -----------------------------------------------------------------------------
Lisp uses prefix notation,  this allows many  functions to supply a lot of argu-
ments at once.

  (+ 1 2 3 4 5 6 7 8 9 0)

Every left parenthesis is called "open", and is followed by an operator, the ri-
ght parenthesis is called "close". But Lisp is not about numbers  or arithmetic;
it's also about list processing. Here is how lists look like:

|#

(list 1 2 3 4 5 6 7 8 9)

(list (list 1 3 5 7 9) (list 2 4 6 8 0))

(list (list 'hello 'world)
      (list (list 'it 'is) 2063)
      (list 'and 'we 'love 'Racket))

; Of course, a language that is about lists has even better ways to write lists:



'(9 8 7 6 5 4 3 2 1)

'((9 7 5 3 1) (0 8 6 4 2))

'((hello world)
  ((it is) 2063)
  (and we love Racket))

; But what happens when we write something like:

'(sqrt (+ (sqr 3) (sqr 4)))

#|

By adding a quote to the left of a piece of Lisp code,we turn it into a piece of
data. In Lisp, all it takes is one  keystroke on your keyboard -one character on
the screen to turn data into code.


4. Where Does Racket Come From?
   -----------------------------------------------------------------------------
Racket comes from Scheme.  Scheme, in turn, was the  response of some Lispers to
the object-oriented trend that appeared in 1972 with Simula and Smalltalk.Scheme
is a very small and regluar language, it is easy to study and even simple to see
the effects of adding one more idea to the language. There was even a  flavor of
Scheme, called T, and developed by Paul Hudak at Yale to compile Scheme code  in
to fast machine code.

5. Chapter Checkpoint
   -----------------------------------------------------------------------------
This introduction acquainted you with some historic background about programming
and the Lisp family of programming languages.

|#

