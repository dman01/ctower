class JoinTableForPortfolioAndInitiatives < ActiveRecord::Migration
  def change
    rename_table :Portfolio_Initiatives, :Initiatives_Portfolios

  end
end
