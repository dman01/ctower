class UpdateDeliverableWithInitiativeId < ActiveRecord::Migration
  def change
    rename_column :deliverables, :initiativeId, :initiative_id
  end
end
