# features/step_definitions/home_page_steps.rb
Given(/^there's a railscast titled "(.*?)" that is watched$/) do |title|
  @railscast = FactoryGirl.create(:railscast, title: title, watched: true)
end

When(/^I am on the homepage$/) do
  visit root_path
end

Then(/^I should see the "(.*?)" railscast with "(.*?)" content$/) do |title, content|
  @railscast = Railscast.find_by_title(title)

  page.should have_content(@railscast.title)
  page.should have_content(content)
end
