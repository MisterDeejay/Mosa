# == Schema Information
#
# Table name: reivews
#
#  id            :integer          not null, primary key
#  body          :text             not null
#  user_id       :integer
#  restaurant_id :integer
#  rating        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class ReivewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
