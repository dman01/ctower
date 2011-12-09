class CreatePortfolioProcesses < ActiveRecord::Migration
  def change
    create_table :portfolio_processes do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
