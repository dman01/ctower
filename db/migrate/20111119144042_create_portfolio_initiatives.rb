class CreatePortfolioInitiatives < ActiveRecord::Migration
  def change
    create_table :portfolio_initiatives do |t|
      t.integer :portfolioId
      t.integer :initiativeId
      t.timestamps
    end
  end
end
