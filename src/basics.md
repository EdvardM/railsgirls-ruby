# The Very Basics of Ruby

## Introduction

Welcome to the wonderful world of Programming!

Programming is all about **abstracting complex** things. While there are
practically no limits to what one can accomplish with programming, even the
most complex ones contain components that consist of more simple components,
until the component deals with just basic language primitives.

Those basic primitives are things that every program contains, and quite
complex things can be done easily by using just those.

### Why yet another tutorial?

There are several better tutorials, but I find even the shortest of those tag
too long. [Why The Lucky Stiff's](http://mislav.uniqpath.com/poignant-
guide/book/chapter-1.html) is an excellent one and far from dry, but it's long
(still recommend it though!).

My attempt is to cover the least amount of knowledge to begin programming,
trusting that missing parts are easily explained when needed. So, lets get
started!

### Notations used

By default, anything that looks like

```ruby
# somefile.rb
puts "Howdy" # here we have some Ruby code
```

is something you can type into Ruby interpreter. That is, open up a
terminal and type `pry` or `irb`.

**irb** stands for "interactive Ruby interpreter" and allows you to try out code
immediately. Pry is a tool that makes working with irb much more nice, has
fancy colours and whatnot. From now on I'll assume you use Pry, but you can
use irb if you like.

{tip-begin}
Sometimes there are tips like this. You can skip these when reading for the first time, but
they often contain useful information you might want to check at least later.
{tip-end}

If the code can be tried as-is, I'll write suggested filename to the top of
the file, like `somefile.rb` above. You may use any name you wish, but you need
to take that into account when you try running the examples.

Anything that looks like

> cd projects/ruby-tutorial

is meant to be typed into the terminal, that is, not in irb or pry. Don't worry, '$' will not be copied if you
want to copy-paste the string.

You also might want to keep three windows open: one editor window, and two
terminal windows in the same directory. The other terminal would then have pry
open, whereas from the other you could run code written in the editor. This
way you don't need to open and reopen things all the time.

### Tools

You only need Ruby for this. Any version at or greater than 1.9.3 should be
ok, though 2.2 and is recommended. You can find out your version by typing

> ruby -v

TBD: installation of pry, link to install script

## Data types

All programs consist of two things: *data* and *functions* that do stuff
with that data. Let's look at a very simple program that has both of these
elements and does something when it is executed.

```ruby
# hello.rb
puts "Oh my, cinnamon buns!"

puts "Kittens are " + " so fluffy"
puts "moar kittens in examples!".upcase
```

Data is just information, like text, numbers, images, videos. It does not do
nothing by itself. Even simple text needs to printed for someone to be able to
read it. Here the **string** `"Oh my, cinnamon buns!"` is the data, as well as
`"Kittens are "`, `"so fluffy"` and so on. `puts` is the function that _does
something with data_, which is just printing whatever is fed to the function.
`upcase` is also a kind of function, acting on the string itself.

While the first example just prints a string, the second joins (or
_concatenates_) two strings together by using `+` operator (in Ruby that's
also a function!). Note that I needed to add trailing space to the string
`"Kittens are "`, otherwise it would have printed `Kittens areso fluffy`.

The last part prints something to the screen in rather demanding manner, due
to `upcase` function that is "tied" to strings.

Also note that you can have either zero or any number of blank lines between
lines of Ruby code. Use blank lines to group things logically, just like in
writing human languages. Ruby does not care: you could write all Ruby programs
in one really long line if you wanted, but readability is for humans; machine
doesn't care. Clarity is important. I added one blank line after the first example
as it is something that does not do anything to strings except print it; the two
after it are a bit more complex, though still simple.

If you wrote that in editor, try it out by saying

> ruby hello.rb

Note that when you pass string data to Ruby in your code, you need to surround
it with double (`"`) or single (`'`) quotes. For now it doesn't matter which, but
try to be consistent.

**Numbers** are also very common. Actually there are several types of numbers to
deal with certain issues, but we don't need to care about those yet. For
example:

```ruby
# numbers.rb
puts 1 + 2

# Note: it's (30 / 3) + 4, not 30 / (3 + 4). Just like you learned at school.
puts 30 / 3 + 4

puts 10 / 3.0    # 3.3333333...
puts 10 / 3      # Note: integral division because all numbers are integral!
```

As before, given you have a terminal open in the same directory, save the file in the editor and run

> ruby numbers.rb

Now we know there are numbers and strings. What about things that have many of
those? Well, we have lists. Or more precisely we talk of _arrays_ in Ruby. You
can do lots of things with those, and they are at the very core of almost all
programs:

```ruby
# arrays.rb
some_stuff = ['kitten', 'dog', 'llama']

puts some_stuff        # prints each string to its own line
puts some_stuff.length # 3, as there are 3 things in the list

 # almost all programming languages use 0-based indexes, so first
 # array element is at 0!
puts some_stuff[0]     # kitten
puts some_stuff[1]     # dog
puts some_stuff[2]     # llama
puts some_stuff[-1]    # -1 means last index, -2 the one before last etc

puts some_stuff.sort   # prints dog, kitten and llama in that order

# Arrays in Ruby can contain mixed things
puts ['dog', 42].length

# Yow dawg, heard you like arrays so I put array in your array
not_even_funny = [2, 'bananas', [4, 5]]
# puts both 4 and 5, as last element is array [4, 5]
puts not_even_funny[-1]
```

By now you have probably guessed that Ruby ignores every line beginning with `#`. Yup.
They are _comments_, meant for human readers.

OK. So now we can have _strings_, _numbers_ and _arrays_, and we have even seen some
functions. But why some of them appear before date, like `puts`, and some after, like
`length`? The latter is an example of a *method*, which you could think of like a function
that is closely tied with data. However, at this point it doesn't matter much
whether you talk about functions or methods. Both act on data, transforming it,
storing it somewhere else (like writing a file), calculate things etc.

There was something else too. That `some_stuff` is a _variable_. You use them
to give shorter, descriptive names to things that are longer to type or
relatively expensive to compute. But arguably the most common reason to use
those is to give things descriptive names. Consider the following:

```ruby
User.all.select { |u| !u.admin? && u.created_at >= Time.now - 7.days }.each do |u|
  puts u
end
```

Unless the reader is quite familiar with Ruby and Rails, it is not easy to see
what is actually printed. Next consider the version that splits up that a bit,
using hopefully more human-readable variable names:

```ruby
min_creation_time = Time.now - 7.days
recent_non_admins = User.all.select { |u| !u.admin? && u.created_at >=  min_creation_time }

recent_non_admins.each do |user|
  puts user
end
```

There are even better ways to make that more descriptive or elegant, but we
don't have tools for that yet. However, we already gained something important:
`recent_normal_users` communicates to the reader that this variable holds
actually a list of users that are not administrators. If you need to change
how users are printed, then you may safely ignore ther more involved
expression of getting those users, knowing know what it does. You only need to
focus on the printing part.

Also note that to introduce a new variable, you simply write that variable and
assign a value to it. Some languages require you to declare those separately,
but in Ruby, you just start using those by assigning them to stuff. In Ruby,
you always assign things to labels by using the equal symbol `=`.

Computer programs are hard to write, but they are often even harder to read,
even your own code. Even after few weeks or so it is easy to lose track of how
a particular piece of code works. Some say you should comment your code, but
even more important is to write readable code. Problem with comments is that
code interpreters and compilers _ignore those_, and they get easily outdated.
Ideal code is self-documenting using descriptive names for variables and
functions. While comments are sometimes the best way to explain things to the
reader, they are seldom needed if you name things well.

Can you use any names for things, then? In practice, yes. All variable names
are totally arbitrary. While `a` or `z` are not very descriptive names, they
are valid names for variables. So is

`a_really_funny_kissa_with_hayfever_danced_over_the_shiny_rainbow`.

Anything consisting of letters a to z, numbers and underscore '_' goes. The only
constraint is that you cannot start it with a number. So `kitteh_42` is a
valid variable name, while `42_kitteh` isn't.

Same rules apply for your own methods and functions.

{tip-begin}
<p>
In Ruby, you should use underscore to separate words in variable names, and
always use downcase letters. UPCASE and SoCalledCamelCase is reserved for constants, classes and
other things we'll talk about later.</p>

<p>You _could_ also use Finnish to name things if you like, which actually works
nowadays due to UTF character set being common. So, you can actually use
variable names like `ämpäri`, which was not that possible only few years back,
and is still impossible with some languages. It doesn't mean you _should_ do
that, though. However, English is _lingua franca_ of computing, and using any
other language to name things will be frowned upon. Others will look at
you with that, you know, face. With a stiff upper lip.</p>

<p>Even though it could be argued that using non-Eglish names for things that you
write makes it more apparent what comes from language and standard libraries,
and what is your own code. I'd still recommend against it. Just stick to English.</p>
{tip-end}


### Wrapping up

So, now we know -- or at least have seen -- three things:

1. Data. There are different types of if, and we have seen three of those:
  * Strings
  * Numbers
  * Arrays, which can contain any data structures, including other arrays[^fn-array]
2. Methods to do things with the data
  * In the example above, we used _array methods_ to get the length of the array with `length`,
    and `sort` to get array contents in alphabetic order. `upcase` converted string to upper case.
  * We will talk more about methods a bit later.
3. We quickly glanced at variables that are just short, descriptive labels for things

## Acting in an intelligent fashion

Imagine you are programming a robot that needs to brew and serve coffee. With
some cream, cinnamon and chocolate chips with a tad of sugar frosting on the
top.

Also imagine I was actually able to actually draw pictures, and here would
be an artsy, nice picture of a jolly good robot pouring a hot cup of Old Joe.
So there.

With the picture in your head, imagine you had programmed the robot to pour
exactly 80cl of coffee and 40cl of cream to each cup. The code might look roughly
like this:

```ruby
bot = Robot.new("Jeeves the Valiant Valet")

bot.pour_coffee(800) # Our robot uses millilitres as the basic unit for fluds
bot.spray_whipped_cream(400)
bot.sprinkle_chocolate_chips(5) # grams maybe
bot.sprinkle_cinnamon(1) # still grams (what's LD50 for cinnamon???)
bot.frost_with_sugar
```

Given everything is ok, our metallic friend would happily crank and whirr
about, making the delicious serving. All fine so far.

Now imagine some poor hapless fellow would accidentally bump the coffee cup so
that it would no longer be under the Robot's coffee-pouring nozzles. Then all
that scalding hot stuff would end up in the floor, messing your carpet. Or
even worse, it might end up hurting that furry
[Scottish Fold](http://www.scottishfoldlove.com/) of yours :( What can we do?

In order to avoid further feline mishaps, we need to have some sort way for
doing things _conditionally_. Given condition, do this. Otherwise do that.

All programming languages have some sort of means to do that. There are even
several means of doing that, most common being the `if` statement:

```ruby
if <condition>
  # code to execute when condition is true
else
  # code to execute when code is NOT true
end
```

Note that the notation `<stuff>` means that `stuff` should not be written
literally, but with appropriate expression. Here it should be some Ruby code
that is equal to value `false`.

Let's assume all the functions our robot Jeeves uses to fill the cup
take advantage of a single utility function `inject`:

```ruby
nozzle.inject('coffee', amount: 800, manner: 'pour')
nozzle.inject('cream', amount: 400, manner: 'spray')
```

To avoid accitents, all our methods would need to detect if the cup is no
longer under the nozzle. So we would edit the `inject` method for nozzles as
follows:

```ruby
def inject(substance, options)
  ...
  if sensors.cup_detected?
    actually_inject_stuff(substance, options)
  else
    system.alert("Please do set your favorite container of hot beverages "
                 "to appropriate position and alignment")
  end
end
```

Now we have fixed the problem! If `sensors.cup_detected?` has the value
`true`, it calls `actuall_inject_stuf`. Otherwise it alerts the user. But we
did not _quite_ fix it yet. Why?

If the cup is moved during the `actually_inject_stuff` call we won't detect
that, because we check `sensors.cup_detected?` only just before we start
injecting stuff. But at least we check it now just before each phase.

### Of things True and False

{tip-begin}
`nil` simply means a _lack of a value_. For example, getting the first
element of an empty array returns nil in Ruby, as all expressions need to return _something_.
{tip-end}

I mentioned before that `if` executes the first section only if the condition
is true. What is true, then? In Ruby, anything that is equal to `false` or `nil`.


Maybe one of the most common way to get a value that is `true` or `false` is
by comparing things. Like any programming language, Ruby gives us many ways to
do just that, and return a respective value:

```ruby
# conditions.rb
2 < 3          # true
3 < 3          # false
40 >= 38 + 2   # true
'banana' == 4     # false, note the double '==' sign
'cat' == 'cat'    # true
'cat' == 'feline' # false
'cat' == 'Cat'    # false
'cute kitten' == 'cute ' + 'kitten' # true
```

{tip-begin}
Often you will hear the term "boolean" when talking about things that are true
or false. That is due to a logician George Boole, and computer scientists
often talk about "Boolean logic". We will talk more about that too, when we
get to more complex conditions.
{tip-end}

The reason why both `40 >= 38 + 2` and `'cute kitten' == 'cute ' + 'kitten'`
work is because they don't compare the _literal code_ you typed, but Ruby
_evaluates_ the code in the both sides of the comparison operator, like `==`
or `>`.

Almost any valid code you write in Ruby is an _expression_ (or list of several
expressions), and that expression has a value, when it is evaluated. For
example, value of a simple expression `2` is just `2`. Value of `'kitten'` is
`'kitten'`, as well with any other literal values. Expression like `38 + 2`
_evaluates_ to 40, so it is equal to value `40`. Same for `'cute ' + 'kitten'`
that evaluates to `'cute kitten'`.

A good way to get familiar with expressions is to toy with things in Pry.
Now go ahead and compare some things to get a taste of using comparison
operators. Note also that every individual line you write is an expression,
and things you get back prom Pry are _values_ of those expressions, computed by Ruby!


### Wrapping up

In normal languages we talk about "programming the microwave" or "programmable
washing machine". In this context it's not precisely programming, but merely
setting up or _sequencing_ some actions, that are always executed in exactly
the same way.

When we talk about computers, we need basically three things in order to be
able to do **anything** (and by anything, I really mean anything that is
theoretically possible):

1. Do stuff in sequence. Doing some task first, then some other tasks.
2. Do something conditionally. Given this, do this. Otherwise, do something else
3. Repetition

Think about this a bit: what the washing machine user interface
should allow you to do, if it was truly programmable?

Next we will talk about the missing third part.

## Repeating things

Imagine you have a list things to do, and you want to format those nicely when printing:

```ruby
# todo.rb
todo_list = ['clean up the kitchen', 'buy some milk', 'make time for learning Ruby', 'consider acquiring a kitten']

# remember that indexes start from zero
puts "TODO item: " + todo_list[0]
puts "TODO item: " + todo_list[1]
puts "TODO item: " + todo_list[2]
puts "TODO item: " + todo_list[3]
```

That code would print all the items, but it sure looks awkward. It's
repetitive, and imagine what it would look like if there are 100 entries.
Surely we can do better.

In Ruby, all data types that _contain_ stuff (CS folks talk about
_collections_ or things you can _iterate_ over) support method `each`. Arrays
are collections of things, so we can replace the code above with a much cleaner
version:

```ruby
# todo2.rb
todo_list = ['clean up the kitchen', 'buy some milk', 'make time for learning Ruby', 'consider acquiring a kitten']

todo_list.each do |entry|
  puts "TODO item: " + entry
end
```

Don't worry about funny pipe characters ('|') yet. First consider the
benefits: due to the loop we don't need to care about array size. That code
would work with list containing only one entry, with list containing
100000000000 entries and even an empty list; it would just print nothing.

Now let's talk about the syntax a bit. It's not that hard, once you get used
to it. Another example:

```ruby
# countdown.rb
put "countdown started"
[5, 4, 3, 2, 1].each do |n|
  puts n
end
puts "go!"
```

That `do` starts a _block_. A Ruby block is just, well, blob of code like any
other ruby code. The interesting stuff is between pipes. Ruby automatically
passes _each item_ (yeah, that's why the name) in the collection to that block
in turn, assigning it to the given variable name, and executes that block _for
each entry_. So, here `puts` is called five times, with `n` being assigned
to each of the numbers in turn.

There are other kinds of loops, though they are maybe not that common. However, the
idea is not to present all of those here, only the most common and useful ones.

One very important loop has the ability to both repeat and check a condition
every time before it starts a new iteration.  It's kind of like `each` with steroids.
Enter `while`:

```ruby
# while.rb
start_time = Time.now
while (Time.now - start_time) < 3
  puts "I should really learn this Ruby stuff."
  sleep 0.5
end
```

Can you guess what it does? First it gets the current time, and stores that to
variable `start_time`. Then it loops over until difference between current
time and `start_time` is at least 3 (`start_time` does not change, while `Time.now`
returns a different value every time, because it returns the current time).

Put more simply, it repeats the loop for 3 seconds, sleeping half a second
after each print.

Note that it does not matter for `while` what the condition is. Remember that in Ruby,
anything is true except things that reduce to `false` or `nil`.  The condition
could compare water level in a reservoir if it is below certain limit. It
could check if there is enough tuna for Fluffy the Cat. It could check the
periapsis for current orbital trajectory, or whatever. The only thing that matters
is the value of the evaluated condition.

Here are some exercises: for each line, think if it would evaluate as true (in `if` or `while` context).

```ruby
2 == 2
'cat' == "cat"
'dog' != 'cat'
1 < 0
3 == 3.0
'false'
false
''
nil
[]
0
[false]
```

It is important to understand that while loop iterates over the code between
`while`... `end` as long as condition is true. The condition is re-checked
_every time_ after it reaches the last line in while, and jumps back to the
beginning, and only then. The loop will not be aborted if the  condition
somehow would change during the execution of while body. Also note that the
loop _will repeat indefinitely_ if the condition never becomes false. For
example, this code never terminates:

```ruby
while true
  puts "repeating this ad infinitum"
  sleep 0.2
end
```

The only way to end the program is by terminating it by force. Fortunately,
you can do this simply by pressing `CTRL+C` in the terminal .Try that if you like.

{tip-begin}
<p>People sometimes use the terms "programming" and "coding" in a mixed
manner. For example, HTML is not strictly programming, though it can called
_coding_. You cannot have conditionals in HTML, nor can you repeat things.</p>

<p>It is also somewhat of a stretch to say that any part of HTML is about "acting" or "executing", but
one could think of say, _title_ element being a "function" to show the document title. Sort
of. But you should at least cringe a bit when saying that. This misconception probably because
you can insert (embed) programming languages to HTML, but that part is not then HTML. It's programming language code.</p>
{tip-end}

Now you should take a deep breath, as we have reached a very important
milestone: you know all the concepts required to code _any kind of computer
program_. Ever. Neat, huh? Some programs would be hard with this information
only, but they would be doable.

We have actions like calculating things, joining strings, assigning values to
variables. We have the ability to make decisions based on values of things.
And we have the ability to repeat stuff.


### Wrapping up

We now learned of the last part, repetition. We had two kinds of loops:

1. `each` we can use with any collection, not needing to know how many items there are
2. `while` that allows repeating things by checking a condition first before each pass

Technically you could do any looping with `while`, but `each` is more
convenient and less verbose when you have a collection to process.

Go get a nice, warm cup of your favorite beverage now! You've deserved it.
Maybe ponder all this stuff a bit. Also please pet your doggy dog or cat if you
have one. Patting a horse is ok too.

[^fn-array] Yeah, there's no limit to nesting. You could have [1, [2, 3], [4, [[5], [6]]]] and there are actually use cases for even more complex situations.
