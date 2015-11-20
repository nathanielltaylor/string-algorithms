class TwoDimensionalArray
  attr_reader :hash

  def initialize
    @hash = {}
  end

  def [](key)
    hash[key] ||= {}
  end

  def rows
    hash.length
  end

  alias_method :length, :rows
end

def compute_lcs_table(string_x, string_y)
  table = TwoDimensionalArray.new
  for i in (0..string_x.length)
    table[i][0] = 0
  end
  for j in (0..string_y.length)
    table[0][j] = 0
  end
  for i in 1..string_x.length
    for j in 1..string_y.length
      if string_x[0..i] == string_y[0..j]
        table[i][j] = (table[i - 1][j - 1]) + 1
      elsif table[i][j - 1] >= table[i - 1][j]
        table[i][j] = table[i][j - 1]
      else
        table[i][j] = table[i - 1][j]
      end
    end
  end
  return table
end

string_x = " CATCGA"
string_y = " GTACCGTCA"

puts compute_lcs_table(string_x, string_y).hash
