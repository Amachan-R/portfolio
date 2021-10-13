class RemoveAgeFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :age, :integer
  end
end
