class User < ActiveRecord::Base
  attr_accessor :total_owed, :total_paid, :net

  has_many :purchases, :class_name => "Expense"
  has_many :benefits
  has_many :expenses, :through => :benefits
end
