module ApplicationHelper
#Page specific titles -ST
def title
	base_title = "Ideaborough"
		return base_title if @title.nil?
		return "#{base_title} | #{@title}"
end
end
