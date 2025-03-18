def add(string)
  string.split(",").map(&:to_i).sum
end
