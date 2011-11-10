class Expense < ActiveRecord::Base
  belongs_to :payer, :class_name => "User", :foreign_key => "user_id"
  has_many :benefits
  has_many :users, :through => :benefits
end
