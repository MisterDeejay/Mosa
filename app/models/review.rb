# == Schema Information
#
# Table name: reviews
#
#  id            :integer          not null, primary key
#  body          :text             not null
#  user_id       :integer
#  restaurant_id :integer
#  rating        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Review < ActiveRecord::Base
  validates :body, presence: true

  belongs_to :user
  belongs_to :restaurant

  default_scope { order('created_at DESC') }
end
