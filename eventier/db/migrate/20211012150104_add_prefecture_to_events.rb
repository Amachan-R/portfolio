class AddPrefectureToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :prefecture, :integer, null: false, default: 0
  end
end
