class RemoveCommentFromMicropost < ActiveRecord::Migration
  def self.up
    remove_column :microposts, :comment
  end

  def self.down
    add_column :microposts, :comment, :string
  end
end
