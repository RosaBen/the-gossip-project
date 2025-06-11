class CreateAuthors < ActiveRecord::Migration[8.0]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.references :user, foreign_key: true  # 👈 c’est ici la bonne façon Rails-style

      t.timestamps
    end
  end
end
