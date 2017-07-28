require 'rails_helper'

feature 'meetups' do
	scenario "visit meetups page should seccessfully" do
		visit meetups_path

		expect(page).to have_css 'h1', text: "Meetups List"
		expect(page).to have_css 'a', text: 'Create a Meetup'
	end

	feature 'new meetup' do
		scenario "should open new meetup successfully" do
			visit new_meetup_path

			expect(page).to have_content "Creat a Meetup"
		end

		scenario "should create meetup successfully" do
			visit new_meetup_path

			within("#meetup-form") do
				fill_in 'meetup[title]', with: 'Rails成都meetup'
				fill_in 'meetup[description]', with: '聚会、学习、dojo随便你，志同道合，共同努力。'
				click_button 'Save'
			end

			expect(page).to have_current_path(meetups_path)
			expect(page).to have_css 'ul li', text: 'Rails成都meetup'
		end
	end
end