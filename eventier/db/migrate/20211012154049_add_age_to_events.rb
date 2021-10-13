class AddAgeToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :age, :integer, null: false, default: 0
  end
end
