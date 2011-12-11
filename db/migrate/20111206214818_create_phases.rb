class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.string :title
      t.text :description
      t.integer :sortOrder
      t.integer :portfolioProcess_id

      t.timestamps
    end
  end
end
