class CreateFrames < ActiveRecord::Migration[6.1]
  def change
    create_table :frames do |t|
      t.string  :name
      t.text    :description
      t.integer :status
      t.integer :stock
      t.float   :price
      t.timestamps
    end
  end
end
