def add(string)

  delimiter = /,|\n/
  custom_delimiter_pattern = /^\/\/(.)\n/

  if match = string.match(custom_delimiter_pattern)
    string = string.sub(custom_delimiter_pattern, '')
    delimiter = Regexp.new(delimiter.source + "|" + Regexp.escape(match[1]))
  end

  string.split(delimiter).map(&:to_i).sum
end
