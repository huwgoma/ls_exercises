# Privacy
# Modify this class so that both flip_switch and switch= are private.
# Further Exploration: Add a private getter for @switch, and add a method
# that displays how to use that getter.

class Machine
  def initialize
    @switch = :off
  end

  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  def switch_status
    "The switch is currently #{switch}."
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

machine = Machine.new
puts machine.switch_status
machine.start
puts machine.switch_status