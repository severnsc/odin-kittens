require 'test_helper'

class KittensIndexTest < ActionDispatch::IntegrationTest

	def setup
		@kitten = kittens(:kitty)
	end

	test "index should display kittens with show/delete links" do
		get kittens_path
		assert_template 'kittens/index'
		assert_select "a[href=?]", kitten_path(@kitten)
		assert_select "a[href=?]", kitten_path(@kitten), method: :delete
	end
end