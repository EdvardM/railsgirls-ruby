## Functions schmunctions

Like mentioned before, functions are means of doing things with data. They can
be very simple (like joining two strings together) or highly complex, and
naturally functions can call other functions.

Many functions are built-in to the language, and huge amount of useful
functions are in the so-called _standard library_ grouped by category. Things
like getting current time, working with files, reading contents of a web page,
convert things from format into another, manage concurrency, compute
trigonometric functions, compress things so that they take less space and so
on. I encourage you to look at [Rubydoc stdlib page](http://www.rubydoc.info/stdlib)
to get an idea of things you have at your disposal, without installing any
software (that is, your Ruby installation already has all that stuff).

Usually functions are introduced by doing arithmetic with numbers. Let's
change that now by doing things with strings. In particular, lets make a
function that returns the  longest string in a list, and let's first write a
small program to find out _how we wish it would work_.

```ruby
# longest_string.rb
# Note that this won't work yet, as the function is not yet defined
puts longest_string(['apple', 'banana', 'mango', 'pear']) # 'banana'
puts longest_string([])     # nil -- that is, when list is empty, return nothing

# let's define our function so that it returns the first string if there
# are several that are equally long
puts longest_string(['dog', 'cat']) # 'dog'
```
Now on to the definition. This is a simple function, but there are still
rather many details in our code. Let's look at it:

```ruby
# longest_string.rb

# (type this definition above test code we wrote in previous step)
def longest_string(ary)
  longest = ary[0] # assign variable `longest` to first value in the array

  # go through array `ary`, assign each item to variable `s`
  # in turn
  ary.each do |s|
    if s.length > longest.length
      longest = s
    end
  end

  longest
end
```
Syntax for defining functions is quite simple. In the most basic form, you
write `def` followed by _function name_, all the _parameters_ (input values)
it needs to work in parentheses, and finish the definition with `end`.

Pay attention to indentation. You see total of 3 `end` markers here, but due
to indentation you can see that the first one closes the `if` condition, the
second closes the `each` block and the last closes the function definition.

Let's look at the definition more closely. After initializing the longest
variable with the first string, we compare each of the strings in `ary` to
`longest`, or more precisely their _lengths_.

Only if a new string is longer than the one we have stored so far, we
overwrite longest to be that string. After checking all the strings with
`each`, we return the value `longest`.

By the way, it does_ work with empty lists as intended. Can you guess why?

Functions and methods in Ruby automatically return the last value in the
method body to the _caller_, so

```puts longest_string(['apple', 'banana', 'mango', 'pear'])```

really prints out "banana"; that is, you could _substitute_ here the
function call `longest_string(['apple', 'banana', 'mango', 'pear'])`
with the value `"banana"`, and from the callers (`puts`) point of view
your program would work exactly the same.

Let's look at another function, just to get the feel of it:

```ruby
BAD_LANGUAGES = ['java', 'php', 'basic', 'perl', 'c++', 'pascal', 'mumps']
OK_LANGUAGES = ['ruby', 'python', 'c', 'scala', 'clojure']

def opinion_on(language)
  lang = language.downcase
  if BAD_LANGUAGES.include?(lang)
    "Uh-oh. You don't want to do this"
  elsif OK_LANGUAGES.include?(lang)
    "You're in a good company"
  else
    lang + ", huh? You must be weird. Or really, really awesome!"
  end
end
```

Here we defined a function that takes a single argument. By the way, copy-paste
that to Pry and try calling that without any arguments, with two arguments, and
single number. Go on, it won't do any harm, but you'll learn useful stuff.
Read the messages Ruby kindly tells you.

There are two things worth mentioning here. **The first** is that we introduced
_constants_ that our function uses to make the function itself a bit shorter
and hopefully more readable. Constants are exactly like variables, with one
crucial difference: _you cannot change their value after initial assignment_.
That's why they are called constants. They serve several purposes, one of
which is to give descriptive names to things like here. The other is to define
something in one place only.

Fox example, imagine you had a program that computes salaries, deducts taxes
and all that stuff. Boring, I know. But imagine there was this magic number 22
repeating all over. If that depicts VAT (how would the reader know?) and it
would change, you should check all the code for occurrences of that digit 22.
Even worse, 22 might appear somewhere _without meaning the same thing_, that
is, it would be totally unrelated to VAT percent 22.

Fortunately, that kind of situations are easy to avoid. Just declare a
constant ```VAT = 22```, and you can then use just `VAT` whenever you want to
say 22, meaning the value added tax, not just any number 22. If it needs to be changed,
you only need to change it in that one place.

{tip-begin}
Programmers talk sometimes about `magic numbers`. They are arbitrary numbers in code
with meaning that is not immediately obvious to the reader. Good rule of thumb
could be that if in doubt, replace the number with constant. Especially if the same
number with the same meaning appears in the code more than once.
{tip-end}

**Another thing** to note is the use of `elsif`. So `if` can not only choose between two "execution paths",
it can have several. It is evaluated from the bottom to top, and if any of the conditions
evaluates to true, that "branch" is executed, and nothing else.

Also note that `else` branch is optional, but often it is better to make that explicit.
So that the reader does not need to think if it has been forgotten. Consider this code:

```ruby
def evaluate_situation(threat_level)
  if threat_level == 'critical'
    "FIRE ZE MISSLES!1!one11!"
  elsif threat_level == 'I am le tired'
    "well have a nap, THEN FIRE ZE MISSLES!"
  end
end
```

Now play with that a bit to see how it works, at least by calling it with
"critical" (that is, type `evaluate_situation("critical")` in Pry).

Suppose we call the function `evaluate_situation("ok")`. What does it return?

Some would argue a proper language would throw a syntax error for `if` without `else`.
Ruby does not, though, and it _implies_ an else-part with `nil`. It is _exactly equivalent_,
that is, in more mathematical terms "just the same stuff" as this:


```ruby
def evaluate_situation(threat_level)
  if threat_level == 'critical'
    "FIRE ZE MISSLES!1!one11!"
  elsif threat_level == 'I am le tired'
    "well have a nap, THEN FIRE ZE MISSLES!"
  else
    nil
  end
end
```

Some people consider the last version unnecessarily verbose, but I like it more. I don't need
to think if `else` was forgotten by accident. Instead I'll trust that ok, if `threat_level`
is anything else than "critical" or "I am le tired" it returns nil.

### Wrapping up

We read a bit more about functions, especially how to _define_ those instead
of just using them. That's where the short keyword `def` comes from (computer
scientists are lazy. I mean.. it saves all _three_ (3) key strokes!).

{tip-begin}
What use is a function without input? Some examples include `Time.now` which returns current time
(try it!), `rand` that returns a random decimal between [0..1] and several others.
{tip-end}

`def` is followed by the name of the function, and you supply any parameters
(input) in parenthesis `()`, if the function has any. Finally you end the
definition with `end`.

Note how calling the function is rather similar to defining it. If you first think how the function
should behave

```ruby
get_me_some_ice_cream('Ben & Jerry', 'Chunky Monkey')
```
it is easy then to find out how the function definition starts:

```ruby
def get_me_some_ice_cream(brand, flavor)
  ...
end
```
Now is a good time to fire up Pry, and try writing some simple functions and call those to see how they work.
Some suggestions:

* function to find out if a string is a palindrome. For the purpose of this exercise, 'foof' is a palindrome even though it likely means nothing
* function to convert inches to cents, and vise versa
* function to find out if a string is too short (specify the limit yourself)
* function to compute BMI. BMI is defined as _mass divided by square of length_ (mass in kilograms, length in meters)
* function to find out distance between two points
* function to find out if a given number is prime (intermediate)

## What next?

Ruby has lots of nice stuff _builtin_, [here nicely grouped by category](http://phrogz.net/programmingruby/builtins.html). You don't need to learn any of that by heart, but I really recommend you to read at least casually through following classes to see what you can do with those:

* [Array](http://phrogz.net/programmingruby/ref_c_array.html#Array)
* [String](http://phrogz.net/programmingruby/ref_c_string.html#String)
* [Hash](http://phrogz.net/programmingruby/ref_c_hash.html#Hash)
* [File](http://phrogz.net/programmingruby/ref_c_file.html#File)
* [Dir](http://phrogz.net/programmingruby/ref_c_dir.html#Dir)
* [Time](http://phrogz.net/programmingruby/ref_c_time.html#Time)

Pay attention to `mixins` declaration in those classes. To put it short, it means that the class "mixes in" all mentioned methods. For example, both `Array` and `Hash` mix in `sort` from module `Enumerable`, which
is why you can say things like `[2, 1, 4].sort` (example for sorting Array).

## Exercises

Programming is a skill you build gradually like any other. As such, even more
complex programs can be started by doing a  very much simplified version first. My
attempt here is to build a certain solution, which starts very simple. You
can try it ouf if you like, and see how far you can go. Note that this is also
_how professionals create actual software_, with the exception that they would likely
skip the very first few steps -- except when they start developing in a new
language (you'd be surprised how "naive" version they often start with though!)

{tip-begin}

Refactoring means simply changing the code in such a manner that externally
the code _behaves exactly the same way_, but the implementation is _better_.
By better I mean such things as the code is more readable, does not contain
lots of repetition, no large functions or methods that do lots of things,
individual things are more simple etc.

One of the most common refactorings is _extracting a method_ (or function), so that
a more involved function becomes more simple, and simply calls the extracted method
to implement some detail. For more comprehensive list of common refactorings, see eg.
http://refactoring.com/catalog/
{tip-end}

After each few steps, remember to _refactor_ the code.

Build a program that

1. reads contents of a file that has some numbers in it, each in it's own line, and prints it out.
1. writes some number to a new file.
1. appends (writes to the end) some number to a file. Note that you want newlines between each number.
1. reads all numbers in a file and prints the sum of those numbers
1. reads a number from command line, writes current date time (with seconds) and that number to a file. Separate time and number by semicolon `;'
1. Add command line parameter to differentiate between whether you want to add value or show stuff (defaulting to show), and also for the filename to use. 'show' will just print all lines. From this on, all versions that display stuff should do that with 'show'.
1. given number of entries in a file, prints out average (mean) of those numbers. You can use the following data
for testing:

    ```
    2015-09-02 22:23:00;70
    2015-09-03 14:58:14;63
    2015-09-04 16:01:25;35
    ```
    Your program should print `56.0`. Use some other filename to avoid overwriting your own data, and skip blank lines.
1. prints latest entry date, value of entry and average for last 5 entries (or all, if there are less)
1. handles situations like
  * file does not exist (for show, with add it creates the file if doesn't exist)
  * file exists but is empty
  * file contains invalid data (skip it, but tell the user what the invalid line was). Note that `.to_i` and `.to_f` silently convert any non-numeric strings to 0! `Integer(val)` and `Float(val)` behave in more sane manner.
1. prints latest entry date and value, with averages for last 3, 7 and 21 entries
1. has modules or classes. At this point everything is mixed together, while clearly some deal
with just transforming data, some with user entries and some with actual logic. Remember _separation of concerns_.
1. treats multiple entries for one day as one, using average of all those as value
1. interpolates values for missing days. Say, if for `day 1` value was `10` and for `day 3` it is `12`,
   assume `day 2` to have value `11`.
1. has [unit test](http://rspec.info/). We are doing serious stuff here, so you want to be certain that your old stuff still
works when you make changes.
1. prints all the data as in step 9, but now including weekly and monthly change. For example, if
we have entry for current date and it's value is 100, and last week ago it was 240, then weekly change
is 140 (negative)
1. as in previous step, but now including **projected values** after one week, at the end of month and after one month. Estimate this using recent rate (eg. last 3 days) and longer interval (eg. 14 days). In projections, indicate both. So the program could print

    ```
    Projected estimates:
       Using last 3 days:
          - after one week: 80.3
          - at the end of month: 78.0
          - after one month: 75.5
       Using last 14 days:
          - after one week: 82.5
          - at the end of month: 79.6
          - after one month: 79.2
    ```

1. can track multiple types of entries, each entry type in it's own file (use custom directory for the
code and separate directory for data files)
1. has a web interface for entering and checking the data. Use eg. Ruby on Rails and [Chartkick](http://chartkick.com/) or similar to show projections / averages graphically with actual data .

Now you have built a nice, general-purpose _linear estimator_. You can use that to track your weight, money usage / savings, running speed, electric bill.. anything that can be measured and represented as single
number per day. Neat, huh :)

**Thinking about estimator, for what kind of values it is an appropriate one? For what it is ill-suited?
