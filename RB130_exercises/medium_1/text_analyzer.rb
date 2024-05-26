# Text Analyzer - Sandwich Code

# Implement the #process method such that it reads a text file (sample.txt),
# passes the text to the given block, and produces the sample output.

# Examples:
class TextAnalyzer
  def process
    file = File.open('sample.txt')
    yield(file.read)
    # your implementation
    file.close
  end
end




analyzer = TextAnalyzer.new
# Paragraphs
analyzer.process { |text| puts "#{text.split("\n\n").size} paragraphs" }

# Lines
analyzer.process { |text| puts "#{text.split("\n").size} lines" }

# Words
analyzer.process { |text| puts "#{text.split.size} words" } 

# 3 paragraphs
# - paragraphs have one empty line between them (2 newline chars)
# 15 lines
# - lines are separated by a single newline character
# 126 words
# - words are space-separated

# #process vs. block:
# - #process should only be responsible for opening the text file, passing it
#   to the block, and then closing the text file.
# - the block should be responsible for everything else:
#   - count the number of paragraphs/lines/words in the text
#   - output the result