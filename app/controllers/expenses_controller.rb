class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
    @users = User.all
    @expense.users.build

    ###  portable code beginning, people owing each other money
    @users.each do |user|
      user.total_owed = 0
      user.total_paid = 0
      user.net=0
      user.expenses.each do |expense|
        divide_number = expense.users.length
        individual_expense = (expense.cost/divide_number)
        user.total_owed += individual_expense
      end
      Expense.find_all_by_user_id(user.id).each do |expense|
        user.total_paid += expense.cost
      end
      user.net = user.total_paid - user.total_owed
    end
  end

  def show
    @expenses = Expense.all
  end

  def create
    @expense = Expense.new(params[:expense])
    @users = User.all
    @expense.users = User.find(params[:user_ids]) if params[:user_ids]
    @expense.save
  end
end
