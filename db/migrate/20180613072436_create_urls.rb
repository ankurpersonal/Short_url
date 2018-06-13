class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.string :given_link, null: false
      t.string :short_link, null: true
      t.integer :count, null: false, default: 0

      t.timestamps
    end
  end
end
