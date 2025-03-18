require 'byebug'

def add(string)
  delimiter = /,|\n/
  custom_delimiter_pattern = /^\/\/(\[(?<delimiter>.*?)\]|(?<delimiter>.))\n/

  if match = string.match(custom_delimiter_pattern)
    string = match.post_match
    delimiter = Regexp.union(delimiter, match[:delimiter])
  end

  numbers = string.split(delimiter).map(&:to_i)

  #find negative numbers
  negatives = numbers.select { |n| n < 0 }
  raise "negative numbers not allowed #{negatives.join(',')}" unless negatives.empty?

  numbers.reject { |n| n > 1000 }.sum
end
