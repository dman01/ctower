class PortfolioRenameCol < ActiveRecord::Migration
  def change
    rename_column :portfolios, :portfolioProcess_id, :portfolio_process_id
  end
end
