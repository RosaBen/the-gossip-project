class AddAuthorToGossips < ActiveRecord::Migration[8.0]
  def change
    add_reference :gossips, :author, foreign_key: true, null: true
  end
end
