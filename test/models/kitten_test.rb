require 'test_helper'

class KittenTest < ActiveSupport::TestCase

	def setup
		@kitten = Kitten.new(name: "Kitty", age: 11, cuteness: "Very cute", softness: "Very soft")
	end

	test "should be valid" do
		assert @kitten.valid?
	end

	test "should have a name" do
		@kitten.name = "  "
		assert_not @kitten.valid?
	end

	test "name should be < 30 chars" do
		@kitten.name = "a"*31
		assert_not @kitten.valid?
	end

	test "should have age" do
		@kitten.age = "  "
		assert_not @kitten.valid?
	end

	test "should have cuteness" do
		@kitten.cuteness = "  "
		assert_not @kitten.valid?
	end

	test "should have softness" do
		@kitten.softness = "  "
		assert_not @kitten.valid?
	end
end
