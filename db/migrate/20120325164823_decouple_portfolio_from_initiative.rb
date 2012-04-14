class DecouplePortfolioFromInitiative < ActiveRecord::Migration
  def change
      add_column :initiatives,:portfolio_id, :integer
  end


end
