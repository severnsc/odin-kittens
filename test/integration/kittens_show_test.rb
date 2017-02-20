require "test_helper"

class KittensShowTest < ActionDispatch::IntegrationTest

	def setup
		@kitten = kittens(:kitty)
	end

	test "should have links to edit and delete" do
		get kitten_path(@kitten)
		assert_template 'kittens/show'
		assert_select "a[href=?]", edit_kitten_path(@kitten)
		assert_select "a[href=?]", kitten_path(@kitten), method: :delete
	end
end