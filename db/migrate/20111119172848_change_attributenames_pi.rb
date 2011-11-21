class ChangeAttributenamesPi < ActiveRecord::Migration
  def change
    rename_column :portfolio_initiatives, :portfolioId, :portfolio_id
    rename_column :portfolio_initiatives, :initiativeId, :initiative_id
end

end
