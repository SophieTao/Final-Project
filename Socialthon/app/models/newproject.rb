class Newproject < ActiveRecord::Base
  belongs_to :user
  has_many :hashtags
end
