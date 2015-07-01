class Person
  # Define default getter methods, but not setter methods.
  attr_reader :name

  def initialize(name)
    @name = name
  end
end
