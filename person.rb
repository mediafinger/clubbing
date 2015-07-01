class Person
  require 'date'

  # Define default getter methods, but not setter methods.
  attr_reader :name, :birthday, :age

  def initialize(name)
    @name = name
  end
end
