class AddHiddenParameterToBullshits < ActiveRecord::Migration[7.1]
  def change
    add_column :bullshits, :hidden_parameter, :string
  end
end
