class Micropost < ActiveRecord::Base
	attr_accessible :content, :coreidea
	
	belongs_to :user
	
	validates :coreidea, :presence => true, :length => { :maximum => 50 }
	validates :content, :length => { :maximum => 140 }
	validates :user_id, :presence => true
	
	default_scope :order => 'microposts.created_at DESC'
end
