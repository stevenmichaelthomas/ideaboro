class Comment < ActiveRecord::Base
  attr_accessible :comment
  
  belongs_to :micropost
  
  validates :comment, :presence => true
  
  default_scope :order => 'comments.created_at ASC'
end
