class Person
  # Define default getter methods, but not setter methods.
  attr_reader :name

  # Delegate to the setter methods instead of setting the instance
  # variables directly.
  def initialize(name)
    # self.      refers to this class
    # self.name  calls the method "name" of the instance of Person
    self.name = name
  end

  # When someone tries to set a name, enforce rules about it.
  # a method that ends on "=" is a setter method
  # it should have the same name as the attribute
  def name=(name)
    # String.empty? does the same as String == ""
    raise_missing_attribute_error("name")  if name.nil? or name.empty?

    name = capitalize(name)
    # set the instance variable @name to be able to access it over person.name
    @name = name
  end

  def capitalize(string)
    string.split(" ").map(&:capitalize).join(" ")

    # == string.split(" ").map { |s| s.capitalize }.join(" ")
    # Example:
    # string = "john doe"
    # string.split(" ")      # ==> ["john", "doe"]
    # string.split(" ").map  # ==> expects a block to manipulate the elements of the array
    #                        # ==> and returns an array
    # { |s| s.capitalize }   # ==> the block passed to map
    #                        # ==> every element of the array is passed in as block variable s
    #                        # ==> then the capitalize method is called on the variable s
    # .join(" ")             # ==> concatenates all elements of the array with " " in between them
    # "John Doe"             # ==> the result
  end

  def raise_missing_attribute_error(attribute)
    # ArgumentError is a Ruby error class
    raise ArgumentError.new("Every #{self.class.name} must have a #{attribute}.")
  end
end
