class PhaseRenameCol < ActiveRecord::Migration
  def change
    rename_column :phases, :portfolioProcess_id, :portfolio_process_id
  end
end
