class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.string :name
      t.string :content

      t.timestamps
    end
  end
end
