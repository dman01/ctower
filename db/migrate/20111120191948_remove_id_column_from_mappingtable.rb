class RemoveIdColumnFromMappingtable < ActiveRecord::Migration
  def change
    remove_column :Initiatives_Portfolios, :id

  end
end
