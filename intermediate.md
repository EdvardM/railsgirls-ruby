## Functions schmunctions

Like mentioned before, functions are means of doing things of data. They can be very simple
(like joining two strings together) or very complex. Usually we want to avoid complexity though
by splitting a complex function to several smaller, less complex ones.

Usually functions are introduced by doing arithmetic with numbers. Let's
change that  by doing things with strings. In particular, lets make a function
that return the  longest string in a list, and let's first write a small
program to find out _how we wish it would work_.

```ruby
longest_string(['apple', 'banana', 'mango', 'pear']) # 'banana'
longest_string([])     # nil -- that is, when list is empty, return nothing

# let's define our function so that it returns the first string if there
# are several that are equally long
longest_string(['dog', 'cat']) # 'dog'
```
Now on to the definition. This is a simple function, but there are still
rather many details in our code. Let's look at it:

```ruby
# longest_string.rb
def longest_string(ary)
  longest = ary[0] # assign variable `longest` to first value in the array

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
it needs to work in parentheses, and finish the definition with `end`. Pay
attention to indentation -- you see total of 3 `end` markers here, but due to
indentation you can see that the first one closes the `if` condition, the
second closes the `each` block and the last closes the function definition.

Let's look at the definition more closely. After initializing the longest
variable with the first string, we compare each of the strings in `ary` to
`longest`, or more precisely their _lengths_.

Only if a new string is longer than the one we have stored so far, we
overwrite longest to be that string. After checking all the strings with
`each`, we return the value `longest`. By the way, it _does_ work with empty
lists as intended. Can you say why?

Functions and methods in Ruby automatically return the last value in the
method body to the _caller_, so

```puts longest_string(['apple', 'banana', 'mango', 'pear'])```

really prints out "banana"; that is, you could _substitute_ here the
function call `longest_string(['apple', 'banana', 'mango', 'pear'])`
with the value `"banana"`, and from the callers point of view
your program would work exactly the same.

Let's look at another function, just to get the feel of it

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
    lang + ", huh? You must be really weird. Or really, really awesome"
  end
end
```

Here we defined a function that takes a single argument. By the way, copy-paste
that to Pry and try calling that without any arguments, with two arguments, and
single number. Go on, it won't do any harm, but you'll learn useful stuff.
Read the messages Ruby kindly tells you.

There are two things worth mentioning here. The first is that we introduced _constants_
that our function uses to make the function itself a bit shorter and hopefully more readable.
Constants are exactly like variables, with one crucial difference: you cannot change their value.
That's why they are called constants. They serve several purpose, one of which is to give descriptive
names to things like here. The other is to use them to define something in one place only.

Fox example, imagine you had a program that computes salaries, deducts taxes
and all that stuff. Boring, I know. But imagine there was this magic number 22 repeating
all over. If that depicts VAT (how would the reader know?) and it would change, you should
check all the code for occurrences of that digit 22. Even worse, 22 might appear somewhere
_without meaning the same thing_, that is, it would be totally unrelated to VAT percent 22.

Fortunately, that kind of situations are easy to avoid. Just declare a
constant ```VAT = 22```, and you can then use just `VAT` whenever you want to
say 22, meaning the value added tax, not just any number 22. If it needs to be changed,
you only need to change it in that one place.

{tip-begin}
Programmers talk sometimes about `magic numbers`. They are arbitrary numbers in code
with semantics that is not immediately obvious to the reader. Good rule of thumb
could be that if in doubt, replace the number with constant. Especially if the same
number with the same meaning appears in the code more than once.
{tip-end}

Another thing to note is the use of `elsif`. So `if` can not only choose between two 'paths',
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

Suppose we call the function `evaluate_situation("ok")`. What does it return?

Some would argue a proper language would throw a syntax error for if without else.
Ruby does not, though, and it _implies_ an else-part with `nil`. It is _exactly equivalent_,
that is, in more mathematical terms "just the same stuff as" this:


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
to think that was `else` forgotten accidentally. Instead I'll trust that ok, if `threat_level`
is anything else than _critical_ or _I am le tired_ it returns nil.

### Wrapping up

We read a bit more about functions, how to _define_ those. You define those
with, um, `def` (computer scientists are just like programmers: lazy. I
mean.. it saves 3 key strokes!), followed by function name, and in parentheses
any parameters (input), if the function has any. Finally you end the definition with `end`.

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
