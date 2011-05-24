class AddCoreideaToMicropost < ActiveRecord::Migration
  def self.up
    add_column :microposts, :coreidea, :string
  end

  def self.down
    remove_column :microposts, :coreidea
  end
end
