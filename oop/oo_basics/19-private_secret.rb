# Add a method named share_secret that prints the value of @secret when invoked.

class Person
  attr_writer :secret

  def share_secret
    puts secret
  end

  private

  attr_reader :secret
end

person = Person.new
person.secret = 'Shh.. this is a secret!'
# person.secret # Can't do this since it's private
person.share_secret # Shh.. this is a secret!