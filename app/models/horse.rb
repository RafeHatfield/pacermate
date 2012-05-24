class Horse < ActiveRecord::Base
  attr_accessible :colour, :foal_date, :racing_name, :sex, :stable_name, :user_id

  validates :user_id, presence: true
  validates :stable_name, presence: true
end
