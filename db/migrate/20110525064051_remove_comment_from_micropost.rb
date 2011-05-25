class RemoveCommentFromMicropost < ActiveRecord::Migration
  def self.up
    remove_column :microposts, :Comment
  end

  def self.down
    add_column :microposts, :Comment, :string
  end
end
