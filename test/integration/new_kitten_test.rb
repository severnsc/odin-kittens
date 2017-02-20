require "test_helper"

class NewKittenTest < ActionDispatch::IntegrationTest

	test "invalid information" do
		get new_kitten_path
		assert_template 'kittens/new'
		assert_select "form[action=?]", kittens_path
		assert_no_difference 'Kitten.count' do
			post kittens_path, params: { kitten: {
				name: " ",
				age: "42",
				cuteness: " ",
				softness: "  "
				}}
		end
		assert_template 'kittens/new'
		assert_select 'div#error_explanation'
		assert_select 'div.alert'
	end

	test "valid information" do
		get new_kitten_path
		assert_template 'kittens/new'
		assert_select "form[action=?]", kittens_path
		assert_difference 'Kitten.count', 1 do
			post kittens_path, params: { kitten: {
				name: "Kitten",
				age: 1,
				cuteness: "Very",
				softness: "very"
				}}
		end
		follow_redirect!
		assert_not flash.empty?
		assert_template 'kittens/show'
	end
end