# FizzBuzz

## Objectives

1. Declare a `for` loop to perform a hardcoded set of iterations.
2. Use `if`, `else if`, and `else` statements to define various behaviors based upon the loop's counter variable.
3. Move the loop's iteration logic from hardcoded values into variables instead.

##### Advanced

1. Attempt your own solution to the FizzBuzz exercise that repeats neither the conditional logic nor instructions.
2. Follow best practice by using variables instead of "magic numbers" in the conditional logic.

## Introduction

*FizzBuzz* is a classic programmer's exercise. It originated from a children's word game used to teach division. The rules are simple: a sequence of numbers is counted out, but every number divisible by three is replaced with "Fizz", every number divisible by five is replaced with "Buzz", and every number divisible by both three *and* five is replaced with "Fizz" *and* "Buzz". A correct recitation of the sequence would follow this pattern:

1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz,  
16, 17, Fizz, 19, Buzz, Fizz, 22, 23, Fizz, Buzz, 26, Fizz, 28, 29, FizzBuzz,  
31 ...

In this code-along, we're going to use the FizzBuzz exercise to practice writing a `for` loop.

**Note:** *We will* ***not*** *be writing an ideal implementation of FizzBuzz.*

## Instructions

Fork and clone this lab. Open the `objc-fizzbuzz.xcodeproj` file and navigate to the `FISAppDelegate.m` file. Write your code inside the `application:didFinishLaunchingWithOptions:` methods before the `return YES;` statement.

1 — Declare a `for` loop that will iterate `100` times. At which value should the counter begin in respect to FizzBuzz?  
**Hint:** *The range of the loop's counter should be* `1` *to* `100`*, not* `0` *to* `99`.

```objc
for (NSUInteger i = 1; i <= 100; i++) { 

}
```
2 — Begin the loop's implementation by printing `i` to the console:

```objc
for (NSUInteger i = 1; i <= 100; i++) { 
    NSLog(@"%lu", i);
}
```
This will print the integers `1` through `100`.

3 — Instead of formatting directly into the `NSLog()`, let's create local string variable called `result` which we can use to set the loop's output based on different conditions. Initialize `result` to an empty string; on a separate line reassign it to the interpolated string containing the loop's counter by using `NSString`'s `stringWithFormat:` method; finally, use the `result` string in the `NSLog()` instead:

```objc
for (NSUInteger i = 1; i <= 100; i++) { 
    NSString *result = @"";
    result = [NSString stringWithFormat:@"%lu", i];
    NSLog(@"%@", result);
}
```
This should still print the integers `1` through `100`.

4 — Now, let's have the loop print `Fizz` on every third iteration. We can accomplish this by using an `if` statement and an `else` statement. In the `if` statement's conditional, use the modulus operator (`%`) to determine if the remainder of dividing the value of `i` by `3` is equal to `0`. If this evaluates to `YES`, the `if` statement should set `result` to `@"Fizz"`. If not, the `else` statement (which is the "default" action) should set `result` to the interpolated string of `i` that we wrote in step 3:

```objc
for (NSUInteger i = 1; i <= 100; i++) { 
    NSString *result = @"";
    
    if (i % 3 == 0) {
        result = @"Fizz";
    }
    else {
        result = [NSString stringWithFormat:@"%lu", i];
    }
    NSLog(@"%@", result);
}
```
This should now print the integers `1` through `100` with every multiple of three (`3`) replaced by the word "Fizz":

```
1
2
Fizz
4
5
Fizz
7
8
Fizz
10
11
Fizz
13
14
Fizz
...
```
5 — Now let's have the loop print "Buzz" on every fifth iteration. Insert an `else if` statement that determines of the remainder (`%`) of dividing the current value of `i` by `5` is equal to `0`. If so, then set `result` to `@"Buzz"`:

```objc
for (NSUInteger i = 1; i <= 100; i++) { 
    NSString *result = @"";
    
    if (i % 3 == 0) {
        result = @"Fizz";
    }
    else if (i % 5 == 0) {
        result = @"Buzz";
    }
    else {
        result = [NSString stringWithFormat:@"%lu", i];
    }
    NSLog(@"%@", result);
}
```
This should now print the integers `1` through `100` with every multiple of three (`3`) replaced by the word "Fizz", and every multiple of five (`5`) that is **not** also a multiple of three replaced by the word "Buzz":

```
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
Fizz
...
```
So, why does every multiple of fifteen (`15`) still print "Fizz"? Remember that an `else if` statement only has a chance to run if none of the `if` or `else if` statements before it runs.

6 — Let's instead start the switch block with an `if` statement that evaluates whether or not the current value of `i` is a multiple of *both* three (`3`) *and* five (`5`). We can use the same remainder logic as the other two evaluations but combine them with "and" logical operator (`&&`). If both of these conditions pass simultaneously, we can set `result` to `@"FizzBuzz"`. We'll also have to alter the current leading `if (i % 3 == 0 ) { ... }` statement into an `else if` statement since it no longer leads the switch block:

```objc
for (NSUInteger i = 1; i <= 100; i++) { 
    NSString *result = @"";
    
    if (i % 3 == 0 && i % 5 == 0) {
        result = @"FizzBuzz";
    }
    else if (i % 3 == 0) {    // becomes an 'else if' statement
        result = @"Fizz";
    }
    else if (i % 5 == 0) {
        result = @"Buzz";
    }
    else {
        result = [NSString stringWithFormat:@"%lu", i];
    }
    NSLog(@"%@", result);
}
```
This should now print the correct sequence to FizzBuzz:

```
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
...
```
7 — Now that we have a working (but **not** ideal) implementation of FizzBuzz, we can play around with the loop's parameters to get a different "slice" of the FizzBuzz sequence. While we could do this directly in the loop's conditional line, let's move the values into variables to follow good-practice guidelines of avoiding "magic numbers". Before the loop, declare two `NSUInteger` variables called `start` and `limit`. Set them equal to `1` and `100` respectively and replace the integers in the `for` loop's conditional line with these new variables.:

```objc
NSUInteger start = 1;
NSUInteger limit = 100;

for (NSUInteger i = start; i <= limit; i++) { 
    NSString *result = @"";
    
    if (i % 3 == 0 && i % 5 == 0) {
        result = @"FizzBuzz";
    }
    else if (i % 3 == 0) {    // becomes an 'else if' statement
        result = @"Fizz";
    }
    else if (i % 5 == 0) {
        result = @"Buzz";
    }
    else {
        result = [NSString stringWithFormat:@"%lu", i];
    }
    NSLog(@"%@", result);
}
```
This should still print the FizzBuzz sequence from `1` to `100`:

```
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
...
```
8 — Now, play around with the values of `start` and `limit`. Try getting the slice of `100` to `130`:

```objc
NSUInteger start = 100;
NSUInteger limit = 130;
...
```

This should print:

```
Buzz
101
Fizz
103
104
FizzBuzz
106
107
Fizz
109
Buzz
Fizz
112
113
Fizz
Buzz
116
Fizz
118
119
FizzBuzz
121
122
Fizz
124
Buzz
Fizz
127
128
Fizz
Buzz
```

## Advanced

1. The FizzBuzz exercise is primarily about best practice and efficiency. Can you identify some of the problems with the implementation of FizzBuzz that we wrote? For starters, it repeats itself, both in the conditional checks, and in the instructions. Can you come up with a better logical structure that doesn't repeat itself?

2. Furthermore, while we did document the starting and ending points for the loop by saving the values into the `start` and `limit` variables, the remainder (`%`) calculations are still written with "magic numbers". Document these values by creating new variables called `fizzIncrement` and `buzzIncrement` that are set to `3` and `5` respectively.
<p data-visibility='hidden'>View <a href='https://learn.co/lessons/objc-fizzbuzz' title='FizzBuzz'>FizzBuzz</a> on Learn.co and start learning to code for free.</p>
