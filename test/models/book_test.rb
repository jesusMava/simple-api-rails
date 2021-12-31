require "test_helper"

class BookTest < ActiveSupport::TestCase
  context "validate present of" do
    should validate_presence_of(:price)
    should validate_presence_of(:name)
  end
end
