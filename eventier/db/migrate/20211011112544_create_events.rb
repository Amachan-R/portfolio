class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|

      t.integer :user_id
      t.string :name
      t.string :image_id
      t.text :caption
      t.string :age
      t.string :prefecture
      t.timestamps
    end
  end
end
