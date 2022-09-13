class CreateGlasses < ActiveRecord::Migration[6.1]
  def change
    create_table :glasses do |t|
      t.integer :user_id
      t.integer :lense_id
      t.integer :frame_id
      t.float   :price
      t.timestamps
    end
  end
end
