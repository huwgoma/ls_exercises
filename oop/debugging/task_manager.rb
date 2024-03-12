# Task Manager
# Find the bug and fix it:

# class TaskManager
#   attr_reader :owner
#   attr_accessor :tasks

#   def initialize(owner)
#     @owner = owner
#     @tasks = []
#   end

#   def add_task(name, priority=:normal)
#     task = Task.new(name, priority)
#     tasks.push(task)
#   end

#   def complete_task(task_name)
#     completed_task = nil

#     tasks.each do |task|
#       completed_task = task if task.name == task_name
#     end

#     if completed_task
#       tasks.delete(completed_task)
#       puts "Task '#{completed_task.name}' complete! Removed from list."
#     else
#       puts "Task not found."
#     end
#   end

#   def display_all_tasks
#     display(tasks)
#   end

#   def display_high_priority_tasks
#     tasks = tasks.select do |task|
#       task.priority == :high
#     end

#     display(tasks)
#   end

#   private

#   def display(tasks)
#     puts "--------"
#     tasks.each do |task|
#       puts task
#     end
#     puts "--------"
#   end
# end

# class Task
#   attr_accessor :name, :priority

#   def initialize(name, priority=:normal)
#     @name = name
#     @priority = priority
#   end

#   def to_s
#     "[" + sprintf("%-6s", priority) + "] #{name}"
#   end
# end

# valentinas_tasks = TaskManager.new('Valentina')

# valentinas_tasks.add_task('pay bills', :high)
# valentinas_tasks.add_task('read OOP book')
# valentinas_tasks.add_task('practice Ruby')
# valentinas_tasks.add_task('run 5k', :low)

# valentinas_tasks.complete_task('read OOP book')

# valentinas_tasks.display_all_tasks

# valentinas_tasks.display_high_priority_tasks

# The Error: 
#   task_manager.rb:38:in `display_high_priority_tasks': private method 
#   `select' called for nil:NilClass (NoMethodError)

# def display_high_priority_tasks
#   tasks = tasks.select do |task|
#     task.priority == :high
#   end

#   display(tasks)
# end

# In the body of the #display_high_priority_tasks method, the `tasks =` 
#   assignment syntax tells Ruby that we are initializing and assigning a new
#   local variable `tasks`; this will create a variable shadowing effect, rendering
#   the `tasks` getter method inaccessible. Before the assignment occurs, the
#   local variable `tasks` has an initial value of `nil`; thus, when `select` is 
#   called on `tasks`, a NoMethodError is raised, as `nil` cannot respond to 
#   `select`.


# To Fix This:
# We can eliminate the 'variable shadowing' effect by simply renaming
#  the `tasks = ` name to something else, eg. `high_prio_tasks = `
# eg.
class TaskManager
  attr_reader :owner
  attr_accessor :tasks

  def initialize(owner)
    @owner = owner
    @tasks = []
  end

  def add_task(name, priority=:normal)
    task = Task.new(name, priority)
    tasks.push(task)
  end

  def complete_task(task_name)
    completed_task = nil

    tasks.each do |task|
      completed_task = task if task.name == task_name
    end

    if completed_task
      tasks.delete(completed_task)
      puts "Task '#{completed_task.name}' complete! Removed from list."
    else
      puts "Task not found."
    end
  end

  def display_all_tasks
    display(tasks)
  end

  def display_high_priority_tasks
    high_prio_tasks = tasks.select do |task|
      task.priority == :high
    end

    display(high_prio_tasks)
  end

  private

  def display(tasks)
    puts "--------"
    tasks.each do |task|
      puts task
    end
    puts "--------"
  end
end

class Task
  attr_accessor :name, :priority

  def initialize(name, priority=:normal)
    @name = name
    @priority = priority
  end

  def to_s
    "[" + sprintf("%-6s", priority) + "] #{name}"
  end
end

valentinas_tasks = TaskManager.new('Valentina')

valentinas_tasks.add_task('pay bills', :high)
valentinas_tasks.add_task('read OOP book')
valentinas_tasks.add_task('practice Ruby')
valentinas_tasks.add_task('run 5k', :low)

valentinas_tasks.complete_task('read OOP book')

valentinas_tasks.display_all_tasks
valentinas_tasks.display_high_priority_tasks