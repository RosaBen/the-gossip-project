class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, index: { unique: true }
      t.text :description, null: false
      t.integer :age, null: false
      t.belongs_to :city, index: true
      t.timestamps
    end
  end
end
