class CreatePrivateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :private_messages do |t|
      # t.timestamps
      t.text :content
      # t.references :sender, null: false, foreign_key: { to_table: :users }
      # t.references :recipient, null: false, foreign_key: { to_table: :users }
    end
  end
end
