class AddProcessToPortfolio < ActiveRecord::Migration
  def change
    add_column :portfolios, :portfolioProcess_id, :integer
  end
end
