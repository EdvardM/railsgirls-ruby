# The Very Basics of Programming in Ruby

## Introduction

Welcome to the wonderful world of Programming! While there are practically no limits to magic of what one can accomplish with programs, even the most wonderful, complex programs are built of components that in turn contain more simple components, those containing more simple things and so on, eventually to the point where we deal with just very simple language primitives.

These simple primitives are building blocks of all programs, and quite complex
things can be done easily by using just those.

### Why yet another tutorial?

There are several much better tutorials, but I find even the shortest of those a bit too long and involved. [Why The Lucky Stiff's](http://mislav.uniqpath.com/poignant-guide/book/chapter-1.html) is an excellent one and far from dry, but it's long (still recommend it though!). My attempt is to introduce the least amount of things to begin programming, trusting that missing parts are easily explained when needed. So, lets get started!

### Notations used

By default, anything that looks like

```ruby
# somefile.rb
puts "Howdy" # here we have some Ruby code
```

is something you can type into Ruby interpreter. That is, open up some sort of terminal and type `pry` or `irb`. "irb" stands for "interactive Ruby interpreter" and allow you to try out code immediately. Pry is a tool that makes working with irb much more nice, has fancy colours and whatnot. From now on I'll assume you use Pry, but you can just use irb if you like.

If the code can be tried as-is, I'll write suggested filename to the top of the file (somefile.rb above). You may use any name you wish, but then you need to take that into account when you try running the examples.

Anything that looks like

> cd projects/ruby-tutorial

is meant to be typed into the terminal (that is, NOT to irb or pry)

So, you might want to keep three windows open: one editor window, and two terminal windows in the same directory. The other terminal would have pry open, whereas from the other you could run code written in the editor. This way you don't need to open and close pry in between.

### Tools

You only need Ruby for this. Any version at or greater than 1.9.3 should be ok, though 2.2 and is recommended. You can find out your version by typing

> ruby -v

TBD: installation of pry, link to install script

## Data types

All programs consist basically of two things: data and functions that do stuff with that data. Let's look at the most simple program that has both of these elements and does something when you run that.

```ruby
# hello.rb
puts "Oh my, cinnamon buns!"

puts "Kittens are " + " so fluffy"
puts "moar kittens in examples!".upcase
```

_Data_ is just information, like text, numbers, images, videos. It does not do nothing by itself. Even simple text needs to printed for someone to be able to read it. Here the _string_ "Oh my, cinnamon buns!" is the data. `puts` is the function that does something with data, which is just printing whatever is fed to the function.

The second example joins (or _concatenates_) two strings together by using `+` operator. Note that I needed to add trailing space to the first string, otherwise it would have printed `Kittens areso fluffy`.

The last part prints something to the screen in rather demanding manner, due to `upcase` "service" that is available to strings.

Last but not least, note that you can have either zero or any number of blank lines between Ruby code. Use blank lines to group
things logically, just like in writing human languages. Ruby does not care: you could write all Ruby programs in one really long line if you wanted, but readability is for humans; machine doesn't care. Clarity is important.

If you wrote that in editor, try it out by saying

> ruby hello.rb

Note that when you pass string data to Ruby in your code, you need to surround it with double (") or single (') quotes. For now it doesn't matter which, but try to be consistent.

Numbers are also very common. Actually there are several types of numbers to deal with certain issues, but we don't need to care about those yet. For example:

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

Now we know there are numbers and strings. What about things that have many of those? Well, we have lists. Or more precisely we talk of _arrays_ in Ruby. You can do lots of things with those, and they are at the very core of almost all programs:

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

OK. So now we can have _strings_, _numbers_ and _arrays_ of those. But what's with the funny things like `.length` and `.sort`? They are aforementioned _functions_ to do things with the data. Or more precisely, as those functions are "attached" to the data are, they are called _methods_. At this point it doesn't matter which term you use.

There was something else too. That `some_stuff` is a _variable_. You use them to simply give shorter names to things that longer to type or that are relatively expensive to compute. But arguably the most common reason to use those is to give descriptive names to things. Consider the following code:

```ruby
User.all.select { |u| !u.admin? && u.created_at >= Time.now - 7.days }.each do |u|
  puts u
end
```

Unless the reader is quite familiar with Ruby and Rails, it is not easy to see what is being printed. Now consider the version that splits up that a bit using hopefully more proper variable names:

```ruby
min_creation_time = Time.now - 7.days
recent_non_admins = User.all.select { |u| !u.admin? && u.created_at >=  min_creation_time }

recent_non_admins.each do |user|
  puts user
end
```

There are actually even better ways to make that more descriptive or elegant, but we don't have tools for that yet. However, we already gained something important: `recent_normal_users` communicates to the reader that this variable holds actually list of users that are not administrators. If you need to change how users are actually printed, you may safely ignore a bit involved expression of getting non-admin
users. You only need to focus on the printing part. Note also that to introduce a new variable, you simply write that variable and assign a value to it. Some languages require you to declare those separately, but in Ruby, you just start using those by assigning them to stuff.

Computer programs are hard to write, but they are often even harder to read, even your own code. Even after few weeks or so it is easy to lose track of how a particular piece of code works. Some say you should comment your code, but even more important is to write readable code. Naming things properly is very important.

Also note that all variable names are totally arbitrary. While `a` or `z` are not very descriptive names, they are valid names for variables. So is `a_really_funny_kissa_with_hayfever_danced_over_the_shiny_rainbow`. Anything consisting of letters a to z, numbers and underscore '_'. The only constraint is that you cannot start it with a number. So `kitteh_42` is a valid variable name, but `42_kitteh` isn't.

{tip-begin}
In Ruby, you should Use underscore to separate words in variable names, and always use downcase letters. Upcase is reserved for constants, classes and other things we'll talk about later.

You _could_ also use Finnish to name things, which actually works nowadays much better due to UTF character set being common enough. Which means you can actually use variable names like `ämpäri`, which was still impossible only few years back and still is with some languages. It diesn't mean you _should_. English is _lingua franca_ of computing, and using any other language to name things will be frowned upon. Though it could be also argued that using non-Eglish names for things that you write makes it more apparent what comes from language and standard libraries, and what is your own code. But I'd still recommend against it.
{tip-end}


### Wrapping up

So, now we know -- or at least have seen -- two things:

1. Data. There are different types of if, and we have seen three of those:
  * Strings
  * Numbers
  * Arrays, which can contain any data structures, including other arrays[^fn-array]
2. Methods to do things with the data
  * In the example above, we used to _array methods_ to get the length of the array, and _sort_ to get array contents in alphabetic order. We will talk more about methods a bit later.
3. We quickly glanced at variables that are just short, descriptive labels for things

## Acting in an intelligent fashion

Imagine you are programming a robot that needs to brew and serve coffee. With some cream, cinnamon and chocolate chips with a tad of sugar frosting on the top. Also imagine I was actually able to actually _draw_ pictures and here would be an artsy nice picture of a jolly good robot pouring a hot cup of Old Joe. With all that sweet stuff on top. So there.

With that picture in your head, imagine you had programmed the robot to pour 80cl of coffee and 40cl of cream to each cup. Now, the code might look roughly like this:

```ruby
bot = Robot.new("Jeeves the Valiant Valet")

bot.pour_coffee(800) # Our robot uses millilitres as the basic fluid unit
bot.spray_whipped_cream(400)
bot.sprinkle_chocolate_chips(5) # grams maybe
bot.sprinkle_cinnamon(1)
bot.frost_with_sugar
```

Given everything is ok, our sympathetic friend would happily crank and whirr about, making the delicious serving. All fine so far.

Now imagine some poor hapless fellow would accidentally bump the coffee cup so that it would no longer be under the Robot's nozzles that pour the coffee. What would happen is that all that scalding hot stuff would end up in the floor, messing your carpet. Or maybe even worse, it might end up hurting that furry [Scottish Fold](http://www.scottishfoldlove.com/) of yours :( What can we do?

In order to avoid further feline mishaps, we need to have some sort way for doing things _conditionally_. Given condition, do this. Otherwise do that.

All programming languages have some sort of means to do that. There are often even several means of doing that, most common being the `if` statement:

```ruby
if <condition>
  # code to execute when condition is true
else
  # code to execute when code is NOT true
end
```

Note that the syntax `<stuff>` means that `stuff` should not be written literally, but with appropriate expression. Here it should be some Ruby code that is equal to value `false`.

Let's assume all the functions our metallic companion uses to put stuff into the cup use a separate function to do exactly that, eg.

```ruby
nozzle.inject('coffee', amount: 800, manner: 'pour')
nozzle.inject('cream', amount: 400, manner: 'spray')
```

Obviously all our methods would need to be able to detect if the cup is no longer under the nozzle, so we would edit the `inject` method for nozzles as follows:

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

Now we have fixed the problem! Well, not _quite_. Why?

If the cup is moved during the `actually_inject_stuff` we don't detect that, because we check for `sensors.cup_detected?` only just before we start injecting stuff. But at least we check it know just before each phase.

## Of things True and False

I mentioned before that `if` executes the first section only if `<condition>` is true. What is true? In Ruby, anything that is equal to `false` or `nil`. You want to ignore `nil` for now though.

Maybe one of the most common way to get a value that is `true` or `false` is to compare things. Like any programming language, Ruby gives us many ways to do just that, and return a respective value:

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

The reason why both `40 >= 38 + 2` and 'cute kitten' == 'cute ' + 'kitten' work is because they don't compare the _literal code_ you typed, but Ruby _evaluates_ the code in the both sides of the comparison operator, like `==` or `>`.

Almost any valid code you write in Ruby is an _expression_ (or list of several expressions), and that expression has a value, when it is evaluated. For example, value of vsimple expression `2` is just `2`. Value of `'kitten'` is `'kitten'`, as well with any other literal values. Expression like `38 + 2` _evaluates_ to 40, so it is equal to value `40`. Same for `'cute ' + 'kitten'` that evaluates to `'cute kitten'`.

A good way to get familiar with expressions is to toy with things in `irb` or `pry`. Now, start either of those and type some stuff, either simple values or
more complex combinations of those. Stuff that you write are expressions, and things you get back are values computed by Ruby!

Often you will hear the term "boolean" when talking about things that are true or false. That is due to a logician George Boole, and computer scientists often talk about "Boolean logic". We will talk more about that too, when we get to more complex conditions.

### Wrapping up

In normal language we talk about "programming" the microwave or washing machine, but in this context it's not what we like to call programming, but merely setting up some actions that are always done in exactly the same way.

When we talk about computers, we need basically three things in order to be able to do anything (and by anything, I really mean anything that is theoretically possible):

1. Do stuff in sequence. Doing some task first, then some other tasks.
2. Do something conditionally. Given this, do this. Otherwise, do something else
3. Repetition

For the latter, we now know of `if` expressions that allow to act us smart by checking arbitrary conditions. Next we will talk about the missing third part.

## Repeating things

```ruby
puts "foo"
puts "bar"

```

[^fn-array] Yeah, there's no limit to nesting. You could have [1, [2, 3], [4, [[5], [6]]]] and there are actually use cases for even more complex situations.
