require 'rails_helper'

describe "delete post process" do
  it "will delete a post" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    post = FactoryGirl.create(:post)
    visit post_path(post)
    click_on 'Delete'
    expect(page).to have_content 'deleted'
  end
end
