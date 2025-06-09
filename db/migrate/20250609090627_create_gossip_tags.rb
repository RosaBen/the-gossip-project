class CreateGossipTags < ActiveRecord::Migration[8.0]
  def change
    create_table :gossip_tags do |t|
      # t.timestamps
      t.belongs_to :tag, index: true
      t.belongs_to :gossip, index: true
    end
  end
end
