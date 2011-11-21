class CreateDeliverables < ActiveRecord::Migration
  def change
    create_table :deliverables do |t|
      t.integer :initiativeId
      t.string :name
      t.string :uniqueID
      t.text :description
      t.date :completionForecast
      t.string :completionDegree

      t.timestamps
    end
  end
end
