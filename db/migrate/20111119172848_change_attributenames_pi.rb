class ChangeAttributenamesPi < ActiveRecord::Migration
  def change
    rename_column :Portfolio_Initiatives, :portfolioId, :portfolio_id
    rename_column :Portfolio_Initiatives, :initiativeId, :initiative_id
end

end
