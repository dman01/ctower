class CreateInitiatives < ActiveRecord::Migration
  def change
    create_table :initiatives do |t|
      t.string :title
      t.text :description
      t.integer :phaseId

      t.timestamps
    end
  end
end
