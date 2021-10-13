class RemovePrefectureFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :prefecture, :string
  end
end
