# == Schema Information
#
# Table name: horses
#
#  id          :integer         not null, primary key
#  racing_name :string(255)
#  stable_name :string(255)
#  sex         :integer
#  colour      :string(255)
#  foal_date   :date
#  user_id     :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Horse < ActiveRecord::Base
  attr_accessible :colour, :foal_date, :racing_name, :sex, :stable_name

  belongs_to :user

  validates :user_id, presence: true
  validates :stable_name, presence: true, length: { maximum: 100 }
  validates :racing_name, length: { maximum: 255 }

  default_scope order: 'horses.stable_name'
end
