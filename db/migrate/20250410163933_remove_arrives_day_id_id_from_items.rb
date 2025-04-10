class RemoveArrivesDayIdIdFromItems < ActiveRecord::Migration[7.1]
  def change
    remove_column :items, :arrives_day_id_id, :integer
  end
end