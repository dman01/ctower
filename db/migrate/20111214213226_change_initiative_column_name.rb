class ChangeInitiativeColumnName < ActiveRecord::Migration
  def change
    rename_column :initiatives, :phaseId, :phase_id
  end
end
