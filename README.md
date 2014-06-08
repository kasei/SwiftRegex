SwiftRegex
==========

Perl-like regex =~ operator for Swift
----------

This package implements a =~ string infix operator for use in testing regular expressions and retrieving sequences of matching sub-strings.

### Example

```
for match in "Hello World" =~ "\\w+" {
    println("matched: \(match)")
}
```

Prints:

```
matched: Hello
matched: World
```
