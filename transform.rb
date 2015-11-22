require_relative 'two_dimensional_array'

def compute_transform_tables(string_x, string_y, copy_c, replace_c, delete_c, insert_c)
  cost = TwoDimensionalArray.new
  op = TwoDimensionalArray.new
  cost[0][0] = 0
  for i in 1..string_x.length
    cost[i][0] = (i * delete_c)
    op[i][0] = "delete #{string_x[i]}"
  end
  for j in 1..string_y.length
    cost[0][j] = (j * insert_c)
    op[0][j] = "insert #{string_y[j]}"
  end
  for i in 1..string_x.length
    for j in 1..string_y.length
      if string_x[i] == string_y[j]
        cost[i][j] = cost[i - 1][j - 1] + copy_c
        op[i][j] = "copy #{string_x[i]}"
      else
        cost[i][j] = cost[i - 1][j - 1] + replace_c
        op[i][j] = "replace #{string_x[i]} by #{string_y[j]}"
      end
      if cost[i - 1][j] + delete_c < cost[i][j]
        cost[i][j] = cost[i - 1][j] + delete_c
        op[i][j] = "delete #{string_x[i]}"
      end
      if cost[i][j - 1] + insert_c < cost[i][j]
        cost[i][j] = cost[i][j - 1] + insert_c
        op[i][j] = "insert #{string_y[j]}"
      end
    end
  end
  return [cost, op]
end

def assemble_transformation(op, i, j)
  return "" if i == 0 && j == 0
  if op[i][j].start_with?("copy") || op[i][j].start_with?("replace")
    return assemble_transformation(op, i - 1, j - 1) + "\n" + op[i][j]
  elsif op[i][j].start_with?("delete")
    return assemble_transformation(op, i - 1, j) + "\n" + op[i][j]
  else
    return assemble_transformation(op, i, j - 1) + "\n" + op[i][j]
  end
end

copy_c = (-1)
replace_c = 1
delete_c = insert_c = 2
# Cost integer values are those described by Cormen for a DNA alignment procedure
# string_x = " ACAAGC"
# string_y = " CCGT"
string_x = " " + IO.read('sequence_one.txt')
string_y = " " + IO.read('sequence_two.txt')

tables = compute_transform_tables(string_x, string_y, copy_c, replace_c, delete_c, insert_c)
puts assemble_transformation(tables[1], string_x.length - 1, string_y.length - 1)
