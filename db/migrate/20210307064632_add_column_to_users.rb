class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def self.up
    add_column :users, :first_name,       :string, after: :email
    add_column :users, :last_name,        :string, after: :first_name
    add_column :users, :join_date,        :date,   after: :last_name
    add_column :users, :phone,            :string, after: :join_date
    add_column :users, :is_administrator, :integer, after: :phone
    add_column :users, :highest_score,    :integer, after: :is_administrator
    add_column :users, :total_matches,    :integer, after: :highest_score
  end

  def self.down
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :join_date
    remove_column :users, :phone
    remove_column :users, :is_administrator
    remove_column :users, :highest_score
    remove_column :users, :total_matches
  end
end
