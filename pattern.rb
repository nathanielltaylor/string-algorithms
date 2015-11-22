def finite_automaton_matcher(string, string_length, next_state_table, pattern_length)
  state = 0
  for i in 1..(string_length - 1)
    state = next_state_table[state][i]
    puts "Pattern found with shift #{pattern_length - i}" if state == pattern_length
  end
end
