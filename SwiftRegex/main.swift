//
//  main.swift
//  SwiftRegex
//
//  Created by Gregory Todd Williams on 6/7/14.
//  Copyright (c) 2014 Gregory Todd Williams. All rights reserved.
//

let value = "Hello, 火星, 🔥🌠!"
let pattern = "[\\u6620-\\U0001F500]"
print("string  : \(value)")
print("pattern : \(pattern)")
for m in value =~ pattern {
    print("matched pattern: \(m)")
}
