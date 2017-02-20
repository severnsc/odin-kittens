require "test_helper"

class EditKittenTest < ActionDispatch::IntegrationTest

	def setup
		@kitten = kittens(:kitty)
	end

	test "edit with invalid information" do
		get edit_kitten_path(@kitten)
		assert_template 'kittens/edit'
		assert_select 'form[action=?]', kitten_path(@kitten)
		patch kitten_path(@kitten), params: { kitten: {
			name: "  ",
			age: 45,
			cuteness: @kitten.cuteness,
			softness: @kitten.softness
			}}
		assert_equal @kitten.age, @kitten.reload.age
		assert_template 'kittens/edit'
		assert_select 'div#error_explanation'
		assert_select 'div.alert'
	end

	test "edit with valid information" do
		get edit_kitten_path(@kitten)
		assert_template 'kittens/edit'
		assert_select 'form[action=?]', kitten_path(@kitten)
		patch kitten_path(@kitten), params: { kitten: {
			name: @kitten.name,
			age: 45,
			cuteness: @kitten.cuteness,
			softness: @kitten.softness
			}}
		assert_equal 45, @kitten.reload.age
		assert_redirected_to kitten_path(@kitten)
		follow_redirect!
		assert_not flash.empty?
		assert_template 'kittens/show'
	end
end