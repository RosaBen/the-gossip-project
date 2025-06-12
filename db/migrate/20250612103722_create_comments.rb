
class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :content, limit: 400  # 👈 max 400 caractères
      t.references :user, null: false, foreign_key: true
      t.references :gossip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
