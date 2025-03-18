def add(string)
  string.gsub("\n", ",").split(",").map(&:to_i).sum
end
