class CreateLenses < ActiveRecord::Migration[6.1]
  def change
    create_table :lenses do |t|
      t.string  :colour
      t.text    :description
      t.integer :prescription_type
      t.integer :lense_type
      t.integer :stock
      t.float   :price
      t.timestamps
    end
  end
end
