class JoinTableForPortfolioAndInitiatives < ActiveRecord::Migration
  def change
    rename_table :portfolio_initiatives, :Initiatives_Portfolios

  end
end
