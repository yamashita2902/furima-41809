class AddArrivesDayIdToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :arrives_day_id, :integer
  end
end
