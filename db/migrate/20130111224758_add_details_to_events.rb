class AddDetailsToEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.text :summary
      t.text :highlights
    end
  end
end
