#lang racket
#|

1. A First Racket Program?
   -----------------------------------------------------------------------------
You are  now ready to write your  first real program, a simple game for guessing
numbers.

2. The Guess My Number Game
   -----------------------------------------------------------------------------
The first game we will write is one of the simplest and oldest games around.It's
the classic "Guess My Number" game. In this game, the player thinks  of a number
between 1 and 100.
Our program  will then figure out  that number by  repeatedly making guesses and
asking the player if her number is bigger or smaller than the current guess.This
what a game might look, if we chose 18:

> (guess)
50
> (smaller)
25
> (smaller)
12
> (bigger)
18

The above interaction involve three different kinds of expressions: (guess), and
(smaller), and (bigger). Everything to the immediate right of "(" is a function,
which means that we are dealing with three functions here:  guess, smaller,  and
bigger.
All you have to do is define these functions, and you have programmed yourself a
first game.

Let us think about the strategy behind this simple game.  The basic steps are as
follows:

  1. Determine or set the upper and lower limits of the player's number.
  2. Guess a number halfway between those two numbers.
  3. If the player says the number is smaller, lower the upper limit.
  4. If the player says the number is bigger, raise the lower limit.

By cutting the range of possible numbers  in half with every  guess, the program
can quickly home in on the player's number.  Cutting the number of possibilities
in half at each step is called a "binary search".

A binary search is frequently used in programming because it's remarkably effec-
tive at finding answers quickly.


3. Defining Variables
   -----------------------------------------------------------------------------
As the player calls the functions that make up our game,the program will need to
update the lower and upper limits at each call.
One way to do so is to store the limits in variables and to change the values of
the variables during the game.
For "Guess my Number", we'll need to create two new variables called "lower" and
"upper". The way to create a new variable is with "define".

|#

(define lower 1)
(define upper 100)

#|

In addition to functions, it is also possible that "(" is followed by a keyword,
such as define. Expressions that start with a keyword work  in their own special
way, depending on the particular keyword. You'll just need to remember the rules
for each keyword.
Fortunatellym there is only a very small number of them.

The define keyword is quite important for understanding Racket programs, as it's
used to define variables and functions. Here we're using it to define variables.
The first part of the define expression is the name of the variable, and the se-
cond is an expression that produces the value we want the variable to have.  One
thing that may surprise you is that a definition does not evaluate to anything.

3. Basic Racket Etiquette
   -----------------------------------------------------------------------------
Because Racket code can be formatted in such flexible ways, Racketeers have con-
ventions for formatting programs,including when to use multiple lines and inden-
tation.
Pressing the "Tab" key in DrRaket automatically idents your code to  follow com-
mon convention.  You can autoindent a chunk of code  by highlighting it and then
pressing the "Tab" key. You  can auto-indent and entire  Racket program just  by
pressing Command+i on a Mac or Ctrl+i on Windows and Linux.


4. Defining Functions in Racket
   -----------------------------------------------------------------------------
Our "Guess My Number" program defines "guess" to  start the game and responds to
requests for either smaller or bigger guesses.  In addition to these three func-
tions, we also define a function  called "start" that starts the game for a dif-
ferent range of numbers. Like variables, functions are defined with "define":


  (define (function-name argument-name ...)
    function-body-expression
    function-body-expression
    ...)

First,we specify the name of the function and the names of its arguments and put
all of them in a pair of parentheses.  Second, we follow it  up with the expres-
sions that comprise the function's logic.

The dots  mean that the  preceding entity  occurs and arbitrary number of times,
zero times, one time, two times, and so on.  It is thus possible that a function
may have zero arguments, but it must have at least one expression in its body.

A Function for Guessing
-----------------------
The first function we'll define is "guess". This function uses the values of the
lower and upper variables to generate a guess of the player's number. In our de-
finitions panel, its definition looks like this:

|#

(define (guess)
  (quotient (+ lower upper) 2))

#|

To indicat that the function does not take any arguments, we place a closing pa-
renthesis directly after the function name "guess".This function calculates that
the best guess in this game is a number halfway between the two limits.To accom-
plish this, we choose the average of the two limits.  If the average number ends
up being a fraction, we choose the nearest whole number.

In other programming languages you may need to write something  like "return" to
cause a value to be returned.  This is not necessary  in Racket, the final value
calculated in the body of the function is returned automatically.

Functions for Closing In
------------------------
Now we'll write our smaller and bigger functions,  which update the upper and lo-
wer variables when necessary.  Like guess,  these functions are  defined with the
define form.

|#

(define (smaller)
  (set! upper (max lower (sub1 (guess))))
  (guess))

#|

We use define to start the definition of any new function. Because smaller takes
no parameters,  the parentheses are wrapped tightly  around smaller. Second, the
function body consists of two expressions, one per line.
Third, the function uses a set! expression to change the value of a variable. In
general, a set! expression has the following shape:

  (set! variable expression)

The purpose of set!, pronounced "set bang",is to evaluate the expression and set
the variable to the resulting value. With this in mind, we can see that the set!
expression in  the definition of  smaller first computes the new maximum number,
and then it assigns that number to upper, giving us the new upper bound.

Since we know the maximum number must be smaller than the last guess,the biggest
it can be is one less than that guess. The code "(sub1 (guess))" calculates this
value. It calls our guess function to get the most recent guess,and then it uses
the function sub1 to subtract 1 from the result.
By taking the max of lower and "(sub1 (guess))",  we ensure that bigger is never
smaller than lower. Finally, we want  our smaller function to  show the player a
new guess. We do so  by putting a call to guess as the  final expression  in the
function body. This time, guess calculates the new guess using the updated value
of upper.

The bigger  function works in the same manner as  smaller, except that it raises
the lower value instead:

|#


(define (bigger)
  (set! lower (min upper (add1 (guess))))
  (guess))

#|

After all, if the player calls the bigger  function, she is saying that her num-
ber is bigger than the previous guess, so the smallest it can now be is one more
than the previous guess.The function add1 simply adds 1 to the value returned by
guess.
Here we see our functions in action, with the number 56 as the player's number:

  > (guess)
  50
  > (bigger)
  75
  > (smaller)
  62
  > (smaller)
  56


The Main Function
-----------------
It is practical to have one main function that starts -or restarts- the whole ap-
plication.  Placing the definition of the main function at the top of the defini-
tions panel also helps readers understand the purpose of the program.For our game
this is a simple feat:

|#

(define (start n m)
  (set! lower (min n m))
  (set! upper (max n m))
  (guess))

#|

The function start takes two arguments,  which are the numbers we want to set as
the lower and upper bounds.  By using the max and min  functions, we cut down on
the instructions that we need to  give any player.   It suffices for a player to
put in any two numbers in any order,and the function can determine the lower and
upper bounds.


  > (start 1 30)
  15
  > (smaller)
  7
  > (bigger)
  11
  > (smaller)
  9
  > (smaller)
  8


5. Recap
   -----------------------------------------------------------------------------
In this chapter, we discussed some basic Racket forms.
  * Use define to define a variable or function.
  * Use set! to change the value of a variable.
  * Use the interactions panel for experimentation.
  * Copy and paste successful experiments to the definitions panel.




|#