class AddForeignKeysToBenefits < ActiveRecord::Migration
  def self.up
    add_column :benefits, :user_id, :integer
    add_column :benefits, :expense_id, :integer

  end

  def self.down
    remove_column :benefits, :user_id
    remove_column :benefits, :expense_id
  end
end
