class Person
  # We will work with Date objects, so we have to require this Ruby library
  require 'date'

  attr_reader :name, :birthday, :age

  # Pay attention!
  #
  # We only expect 1 argument now, called "arguments"
  # "arguments" must be a Hash
  #
  # We expect "arguments" to contain the elements "name" and "birthday"
  #
  def initialize(arguments)
    self.name     = arguments[:name]
    self.birthday = arguments[:birthday]
  end

  def name=(name)
    raise_missing_attribute_error(attribute: "name") if name.nil? || name.empty?

    name = capitalize(name)
    @name = name
  end

  def birthday=(birthday)
    raise_missing_attribute_error(attribute: "birthday") if birthday.nil? || birthday.empty?
    birthday = ensure_date(birthday) # we pass in the String birtdhay and

    set_age(birthday)

    @birthday = birthday
  end

  private

  def set_age(birthday)
    @age = (Date.today - birthday).to_i / 365
  end

  # very short way of doing this - check commented version in branch master
  def capitalize(string)
    string.split(" ").map(&:capitalize).join(" ")
  end

  def ensure_date(birthday)
    begin
      Date.parse(birthday)  # this converts our string "birthday" into a Date object
    rescue ArgumentError
      raise_wrong_attribute_error(attribute: "birthday", klass: Date) unless birthday.is_a?(Date)
    end
  end

  # We spell "klass" with "k" as "class" is a keyword in ruby
  def raise_wrong_attribute_error(attribute:, klass:)
    raise ArgumentError.new("Every #{self.class} must have a #{attribute} of type #{klass}.")
  end

  def raise_missing_attribute_error(attribute:)
    raise ArgumentError.new("Every #{self.class} must have a #{attribute}.")
  end
end
