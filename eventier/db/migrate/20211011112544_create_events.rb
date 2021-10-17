class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|

      t.integer :user_id
      t.string :name
      t.string :image_id
      t.text :caption
      t.string :age, null: false, default: 0
      t.string :prefecture, null: false, default: 0
      t.timestamps
    end
  end
end
