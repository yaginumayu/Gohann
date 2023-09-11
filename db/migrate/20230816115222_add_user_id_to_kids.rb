class AddUserIdToKids < ActiveRecord::Migration[6.1]
  def change
    add_column :kids, :user_id, :integer
  end
end
