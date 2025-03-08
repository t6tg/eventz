class AddFieldsToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :starts_at, :datetime
    add_column :events, :description, :s
  end
end
