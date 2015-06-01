class ChangeDatatypeOnOpinionFromStringToText < ActiveRecord::Migration
  def change
    change_column :opinions, :content, :text, :limit => nil    
  end
end
