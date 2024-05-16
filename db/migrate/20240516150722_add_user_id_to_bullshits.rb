class AddUserIdToBullshits < ActiveRecord::Migration[7.1]
  def change
    add_column :bullshits, :user_id, :integer
  end
end
