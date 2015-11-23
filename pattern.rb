require_relative 'two_dimensional_array'
require 'pry'

def finite_automaton_matcher(string, string_length, next_state_table, pattern_length)
  state = 0
  for i in 1..(string_length - 1)
    state = next_state_table[state][string[i]]
    puts "Pattern found with shift #{i - (pattern_length - 1)}" if state == pattern_length
    puts state
  end
end

def compute_next_state_table(pattern, letter_options, pattern_length)
  next_state = TwoDimensionalArray.new
  for k in 0..(pattern_length)
    for a in 0..(letter_options.length - 1)
      prefix_k = pattern[0..k]
      pka = prefix_k + letter_options[a]
      if pka.length > (pattern_length)
        i = (pattern_length)
      else
        i = pka.length
      end
      while pka.end_with?(pattern[i]) == false
        i -= 1
        # binding.pry
      end
      next_state[k][a] = i
    end
  end
  return next_state
end


letter_options = ["A", "T", "C", "G"]
pattern = " AAC"
string = " GTAACAGTAAACG"

table = compute_next_state_table(pattern, letter_options, pattern.length)
puts table.hash
puts finite_automaton_matcher(string, string.length, table, pattern.length)
