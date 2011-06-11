class Micropost < ActiveRecord::Base	

	attr_accessible :content, :coreidea
	 
	belongs_to :user
	has_many :comments, :dependent => :destroy
	
	validates :coreidea, :presence => true, :length => { :maximum => 50 }
	validates :content, :length => { :maximum => 200 }
	validates :user_id, :presence => true
	
	default_scope :order => 'microposts.created_at DESC'
	
	
end
