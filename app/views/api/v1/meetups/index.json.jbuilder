json.meta do
	json.current_page @meetups.current_page
	json.total_pages @meetups.total_pages
	json.per_page @meetups.per_page
	json.total_entries @meetups.total_entries

	if @meetups.current_page == @meetups.total_pages
		json.next_url nil
	else
		json.next_url api_v1_meetups_url( :page => @meetups.next_page )
	end

	if @meetups.current_page == 1
		json.previous_url nil
	else
		json.previous_url api_v1_meetups_url( :page => @meetups.previous_page )
	end
end

json.data do
	json.array! @meetups do |meetup|
		json.title meetup.title
		json.description meetup.description
	end
end