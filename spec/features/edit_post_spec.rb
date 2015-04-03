require 'rails_helper'

describe "edit post process" do
  it "will edit a post" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit '/'
    post = FactoryGirl.create(:post)
    visit post_path(post)
    click_on 'Edit Post'
    fill_in 'Title', with: 'Tennis'
    fill_in 'Content', with: 'You get to wear cool skorts!'
    click_on 'Post'
    expect(page).to have_content 'updated'
  end
end
