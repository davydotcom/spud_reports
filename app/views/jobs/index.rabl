collection @printers
attributes :id, :name, :access_token
child :active_jobs do 
	attributes :id,:name,:attachment_content_type,:attachment_file_name,:pages,:status 
end
