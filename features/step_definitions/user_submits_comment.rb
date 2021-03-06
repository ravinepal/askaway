When(/^I visit question page$/) do
  @question = FactoryGirl.create(:question)
  visit question_path(@question)
end

When(/^I fill out the comment form$/) do
  @comment_body = Faker::Lorem.paragraph + " http://bit.ly/example"
  fill_in 'comment_body', with: @comment_body
  click_on 'Post comment'
end

When(/^I fill out the comment form with "(.*?)"$/) do |arg1|
  @comment_body = arg1
  fill_in 'comment_body', with: @comment_body
  click_on 'Post comment'
end

Then(/^I should see my comment at the top of the list$/) do
  expect(page).to have_content(@comment_body.gsub("http://", ""))
end

Then(/^I should not see my comment in the list$/) do
  expect(page).to_not have_content(@comment_body)
end

Then(/^I should see my link is autolinked$/) do
  expect(page).to have_link("bit.ly/example", :href => "http://bit.ly/example")
end
