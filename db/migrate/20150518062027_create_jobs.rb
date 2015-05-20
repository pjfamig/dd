class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.text :company
      t.text :position
      t.text :location
      t.text :url
      t.references :user, index: true

      t.timestamps
    end
  end
end
