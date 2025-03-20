class RenameDeliverystyleIdToDeliveryStyleId < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :deliverystyle_id, :delivery_style_id
  end
end
