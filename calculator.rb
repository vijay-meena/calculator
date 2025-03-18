def add(string)

  delimiter = /,|\n/
  custom_delimiter_pattern = /^\/\/(.)\n/

  if match = string.match(custom_delimiter_pattern)
    string = string.sub(custom_delimiter_pattern, '')
    delimiter = Regexp.new(delimiter.source + "|" + Regexp.escape(match[1]))
  end

  numbers = string.split(delimiter).map(&:to_i)

  #find negative numbers
  negatives = numbers.select { |n| n < 0 }
  raise "negative numbers not allowed #{negatives.join(',')}" unless negatives.empty?

  numbers.sum
end
