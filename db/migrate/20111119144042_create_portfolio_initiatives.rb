class CreatePortfolioInitiatives < ActiveRecord::Migration
  def change
    create_table :portfolio_initiatives do |t|

      t.timestamps
    end
  end
end
