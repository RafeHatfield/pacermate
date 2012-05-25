class Horse < ActiveRecord::Base
  attr_accessible :colour, :foal_date, :racing_name, :sex, :stable_name

  belongs_to :user

  validates :user_id, presence: true
  validates :stable_name, presence: true

  default_scope order: 'horses.stable_name'
end
