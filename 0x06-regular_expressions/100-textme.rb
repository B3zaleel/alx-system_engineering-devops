#!/usr/bin/env ruby
ptn = /(?:(?<=from:)(?:\p{L}+|\+?\d+)|(?<=to:)(?:\p{L}+|\+?\d*)|(?<=flags:)(?:-?\d+:?)*)/
puts ARGV[0].scan(ptn).join(',')
