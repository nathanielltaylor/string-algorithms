require_relative 'two_dimensional_array'

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
      if string_x[i] == string_y[j]
        table[i][j] = ((table[i - 1][j - 1]) + 1)
      elsif table[i][j - 1] >= table[i - 1][j]
        table[i][j] = table[i][j - 1]
      else
        table[i][j] = table[i - 1][j]
      end
    end
  end
  return table
end

def assemble_lcs(string_x, string_y, table, x_index, y_index)
  return "" if table[x_index][y_index] == 0
  if string_x[x_index] == string_y[y_index]
    return assemble_lcs(string_x, string_y, table, x_index - 1, y_index - 1) + string_x[x_index]
  elsif table[x_index][y_index - 1] > table[x_index - 1][y_index]
    return assemble_lcs(string_x, string_y, table, x_index, y_index - 1)
  else
    return assemble_lcs(string_x, string_y, table, x_index - 1, y_index)
  end
end

string_x = " CATCGA"
string_y = " GTACCGTCA"

table = compute_lcs_table(string_x, string_y)
puts assemble_lcs(string_x, string_y, table, string_x.length - 1, string_y.length - 1)
