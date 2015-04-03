require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "add new comment process" do
  it "will show the new comment" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    post = FactoryGirl.create(:post)
    visit post_path(post)
    click_on 'Comment'
    fill_in 'Text', with: 'That is so cool!'
    click_on 'Submit'
    expect(page).to have_content 'Comment added'
  end
end
