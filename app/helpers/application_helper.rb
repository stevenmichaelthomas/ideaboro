module ApplicationHelper
#Page specific titles -ST
	def title
		base_title = "Ideaborough"
			return base_title if @title.nil?
			return "#{base_title} | #{@title}"
	end
#Logo definition
	def logo
		image_tag("logo.png", :alt => "Ideaborough", :class => "round")	
	end
	def default
		image_tag("default.png", :alt => "Ideaborough", :class => "round")	
	end

end
