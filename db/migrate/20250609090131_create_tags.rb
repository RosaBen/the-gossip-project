class CreateTags < ActiveRecord::Migration[8.0]
  def change
    create_table :tags do |t|
      # t.timestamps
      t.string :title, index:{ unique: true}
    end
  end
end
