require 'rails_helper'

RSpec.describe "API_V1::Meetups", :type => :request do
	
	before do
		@user = create_user
		@meetup1  = @user.meetups.create!(title: 'Rails成都meetup', description: '聚会、学习、dojo随便你，志同道合，共同努力。')
		@meetup2  = @user.meetups.create!(title: 'Ruby北京meetup', description: '一起写作业')
	end

	example 'GET /api/v1/meetups' do
		get '/api/v1/meetups'

		expect(response).to have_http_status(200)

		expect_result = {
			"meta": {
					"current_page": 1,
					"total_pages": 1,
					"per_page": 30,
					"total_entries": 2,
					"next_url": nil,
					"previous_url": nil
				},
			"data": [
				{
					"title": @meetup1.title,
					"description": @meetup1.description
				},
				{
					"title": @meetup2.title,
					"description": @meetup2.description
				}
			]
		}

		expect(response.body).to eq( expect_result.to_json )
	end

end