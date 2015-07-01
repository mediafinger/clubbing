require "minitest/autorun"
require_relative "../person"

class PersonTest < Minitest::Test
  # the setup method is run before every test
  def setup
    @sample_birthday = "1985-06-30"      # the date format is called ISO8601
    @sample_name     = "andreas finger"

    @arguments = { name: @sample_name, birthday: @sample_birthday }
  end

  # name tests

  def test_name_mandatory
    @arguments.delete(:name)
    assert_raises(ArgumentError) { person = Person.new(@arguments) }
  end

  def test_name_mandatory_and_not_empty
    @arguments[:name] = ""

    assert_raises(ArgumentError) { person = Person.new(@arguments) }
  end

  def test_name_capitalized
    @arguments[:name] = "andreas"
    person    = Person.new(@arguments)

    assert_equal "Andreas", person.name
  end

  def test_first_name_and_last_name_capitalized
    person = Person.new(@arguments)
    assert_equal "Andreas Finger", person.name
  end

  # birthday tests

  def test_birthday_mandatory
    @arguments.delete(:birthday)
    assert_raises(ArgumentError) { person = Person.new(@arguments) }
  end

  def test_birthday_mandatory_and_not_empty
    @arguments[:birthday] = ""

    assert_raises(ArgumentError) { person = Person.new(@arguments) }
  end

  def test_birthday_is_a_date
    @arguments[:birthday] = "not a date"

    assert_raises(ArgumentError) { person = Person.new(@arguments) }
  end

  def test_birthday_valid
    person    = Person.new(@arguments)

    assert_equal Date.parse(@sample_birthday), person.birthday
  end

  # age tests

  def test_age_is_set
    person    = Person.new(@arguments)

    assert_equal 30, person.age # note: this test will fail in a year from now ;-)
  end
end
