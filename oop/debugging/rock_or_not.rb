require 'pry'
# Does it Rock or Not?
# class AuthenticationError < Exception; end

# # A mock search engine
# # that returns a random number instead of an actual count.
# class SearchEngine
#   def self.count(query, api_key)
#     unless valid?(api_key)
#       raise AuthenticationError, 'API key is not valid.'
#     end

#     rand(200_000)
#   end

#   private

#   def self.valid?(key)
#     key == 'LS1A'
#   end
# end

# module DoesItRock
#   API_KEY = 'LS1A'

#   class NoScore; end

#   class Score
#     def self.for_term(term)
#       positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY)
#       negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY)

#       (positive * 100) / 0 # (positive + negative)
      
#     rescue Exception
#       NoScore
    
#     end
#   end

#   def self.find_out(term)
#     score = Score.for_term(term)

#     case score
#     when NoScore
#       "No idea about #{term}..."
#     when 0...40
#       "#{term} is not fun."
#     when 40...60
#       "#{term} seems to be ok..."
#     else
#       "#{term} rocks!"
#     end
#   rescue Exception => e
#     e.message
#   end
# end

# # Example (your output may differ)

# puts DoesItRock.find_out('Sushi')       # Sushi seems to be ok...
# puts DoesItRock.find_out('Rain')        # Rain is not fun.
# puts DoesItRock.find_out('Bug hunting') # Bug hunting rocks!

# To test the API key authentication, we can set DoesItRock::API_KEY to any 
#   string other than the correct key ('LS1A').
# When the API Key is wrong, we want the mock search engine to raise an 
#   AuthenticationError, and we want the DoesItRock::find_out method to catch
#   the error and print the error message ('API key is not valid')

# However, this behavior does not occur. Why? How can we fix this?

# What happens instead: We always get the following 3 lines of output:
# Sushi rocks!
# Rain rocks!
# Bug hunting rocks!

# How this error occurs:
# 1) When our API_KEY is incorrect, the SearchEngine::count method will raise an
#     AuthenticationError, as expected.
# 2) This exception is raised in the Score::for_term method, which calls 
#     SearchEngine.count with an invalid API_KEY.
# 3) The AuthenticationError is rescued by the `rescue Exception` clause in
#     Score::for_term, which returns the NoScore classname constant.
# 4) Because the AuthenticationError was rescued within Score::for_term, the 
#     rescue block of DoesItRock::find_out is never executed.

# Part 2 of the error:
# 5) The value referenced by `score` (NoScore constant) is compared against each
#     `when` statement, using the when statement's `#===` method.
# 6) The reason why `NoScore === NoScore` returns `false` is due to how 
#     the `Module#===` method works - `Module#===` returns true only if the 
#     argument is an instance of the calling class name, or one of its descendants.
#   - In other words, Array === Array returns true if Array (right) is an instance
#     of Array (left), which it is not.
# 7) Thus, NoScore === score (NoScore) returns false, as does every other `when` 
#     statement; since none of the `when` statements matched the case object, the
#     `else` clause is evaluated (hence the constant "__ rocks!" output.)

# * Also we are inheriting from/rescuing Exception which is a bad practice


# How to Fix: 
# 1) Change Exception subclasses:
#   - AuthenticationError should inherit from StandardError
#   - Score::for_term should rescue ZeroDivisionError
#   - DoesItRock::find_out should rescue AuthenticationError
# 2) Since Score::for_term no longer rescues all exceptions, the 
#     AuthenticationError will only be rescued in DoesItRock::find_out.
# 3) If there is a ZeroDivisionError, we should return a new *instance* of the
#     NoScore class. Module#=== checks if the argument is an instance of the caller,
#     so NoScore === NoScore.new will return true.
# eg.
class AuthenticationError < StandardError; end

# A mock search engine
# that returns a random number instead of an actual count.
class SearchEngine
  def self.count(query, api_key)
    unless valid?(api_key)
      raise AuthenticationError, 'API key is not valid.'
    end

    rand(200_000)
  end

  private

  def self.valid?(key)
    key == 'LS1A'
  end
end

module DoesItRock
  API_KEY = 'LS1Ab'

  class NoScore; end

  class Score
    def self.for_term(term)
      positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY)
      negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY)

      (positive * 100) / (positive + negative)
    rescue ZeroDivisionError
      NoScore.new
    end
  end

  def self.find_out(term)
    score = Score.for_term(term)

    case score
    when NoScore
      "No idea about #{term}..."
    when 0...40
      "#{term} is not fun."
    when 40...60
      "#{term} seems to be ok..."
    else
      "#{term} rocks!"
    end
  rescue AuthenticationError => e
    e.message
  end
end

# Example (your output may differ)

puts DoesItRock.find_out('Sushi')       # Sushi seems to be ok...
puts DoesItRock.find_out('Rain')        # Rain is not fun.
puts DoesItRock.find_out('Bug hunting') # Bug hunting rocks!