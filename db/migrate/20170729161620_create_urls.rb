# This is the table for url related data
class CreateUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :urls do |t|
      t.string 'full_url'
      t.string 'shortened_url'
      t.integer 'count', default: 0
      t.timestamps null: false
    end
  end
end
