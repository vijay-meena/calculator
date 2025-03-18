def add(string)
  delimiters = /,|\n/
  custom_delimiter_pattern = /^\/\/(?<delimiter>(?:\[.+?\])+|.)\n/

  if match = string.match(custom_delimiter_pattern)
    string = match.post_match
    matched_delimiters = match[:delimiter].scan(/\[(.*?)\]/).flatten
    matched_delimiters.push(match[:delimiter]) if matched_delimiters.empty?
    delimiters = Regexp.union(delimiters, *matched_delimiters)
  end

  numbers = string.split(delimiters).map(&:to_i)

  #find negative numbers
  negatives = numbers.select { |n| n < 0 }
  raise "negative numbers not allowed #{negatives.join(',')}" unless negatives.empty?

  numbers.reject { |n| n > 1000 }.sum
end
