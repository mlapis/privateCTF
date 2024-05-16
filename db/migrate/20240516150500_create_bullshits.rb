class CreateBullshits < ActiveRecord::Migration[7.1]
  def change
    create_table :bullshits do |t|
      t.string :title
      t.text :description
      t.string :random_field

      t.timestamps
    end
  end
end
