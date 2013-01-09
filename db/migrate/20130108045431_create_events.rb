class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer "creator_id"
      t.string   "name"
      t.string   "street"
      t.string   "zip_code"
      t.datetime "occurs_at"
      t.timestamps
    end
  end
end
