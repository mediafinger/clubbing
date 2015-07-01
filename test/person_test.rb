require "minitest/autorun"
require_relative "../person"

class PersonTest < Minitest::Test
  def test_name_mandatory
    assert_raises(ArgumentError) { person = Person.new }
  end

  def test_name_mandatory_and_not_empty
    assert_raises(ArgumentError) { person = Person.new("") }
  end

  def test_name_capitalized
    person = Person.new("andreas")
    assert_equal "Andreas", person.name
  end

  def test_first_name_and_last_name_capitalized
    person = Person.new("andreas finger")
    assert_equal "Andreas Finger", person.name
  end
end
