### String Algorithms and DNA Analysis
Experimenting with longest common subsequence algorithms in Ruby, specifically as applicable to computational biology and genome analysis.

- The methods in lcs.rb create a table of lengths of longest common subsequences for each possible combination of subsequences of the two input strings. This is then used to find the exact sequence of the (or a) longest common subsequence for the two initial full subsequences

- The methods in transform.rb create tables of the minimum possible costs of transforming each combination of two subsequences being compared into each other (the cost table), while the op table keeps track of the final character manipulation operation (copy, replace, delete, or insert) that would have been performed in this transformation. These tables are then used to create an ordered list of the steps that need to be performed to transform one sequence into another with the lowest possible cost

- The pattern matching algorithm, which is currently a work in progress, will eventually return the location of each occurrence of the given pattern within a larger string as the integer value of the number of characters the first character of the pattern is offset from the first character of the overall string. It does this by constructing a finite automaton that stores the next "state" or the amount of the pattern that has currently been matched, based on the character it has most recently read. This allows it to read through the source string looking at each character only once 

- These methods are facilitated by the TwoDimensionalArray custom class, which allows a set of nested hashes to be interacted with as though they were a two-dimensional array.

These algorithms are based on those described in Chapter 7 of Thomas H. Cormen's "Algorithms Unlocked".
