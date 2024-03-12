require 'pry'

class Pet
  attr_reader :species, :name
  @@pets = []

  def initialize(species, name)
    @species, @name = species, name
    @@pets << self
  end

  def to_s
    "a #{species} named #{name}"
  end

  def self.list
    @@pets
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def adopt_pet(pet)
    pets << pet
  end

  def number_of_pets
    pets.size
  end
end

class Shelter
  attr_reader :adoptions, :unadopted_pets

  def initialize
    @unadopted_pets = Pet.list.dup
    @adoptions = {}
  end

  def adopt(owner, pet)
    unadopted_pets.delete(pet)

    owner.adopt_pet(pet)
    adoptions[owner] = owner.pets
  end

  def print_adoptions
    adoptions.each do |owner, pets|
      puts "#{owner.name} has adopted the following pets:"
      puts pets
    end
  end

  def print_unadopted
    puts "The Animal shelter has the following unadopted pets:"
    puts unadopted_pets
  end

  def unadopted_count
    unadopted_pets.size
  end
end


# Adopted
butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

# Unadopted
asta      = Pet.new('dog', 'Asta')
laddie    = Pet.new('dog', 'Laddie')
fluffy    = Pet.new('cat', 'Fluffy')
bluebell  = Pet.new('parakeet', 'Bluebell')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

shelter.print_unadopted
# The Animal shelter has the following unadopted pets:
# a dog named Asta
# a dog named Laddie
# a cat named Fluffy
# a parakeet named Bluebell

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "The Animal shelter has #{shelter.unadopted_count} unadopted pets."
# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.
# The Animal shelter has 7 unadopted pets.
