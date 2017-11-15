class AddAvatarColumnsToProduct < ActiveRecord::Migration[5.1]

  def self.up     
    change_table :products do |t|  
      t.has_attached_file :avatar     
    end 
  end 
   
  def self.down   
    drop_attached_file :products, :avatar   
  end 
end