require 'rails_helper'

describe 'edit comment process' do
  it 'will edit a comment' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    post = FactoryGirl.create(:post)
    visit post_path(post)
    click_on 'Comment'
    fill_in 'Text', with: 'That is so cool!'
    click_on 'Submit'
    click_on 'Edit Comment'
    fill_in 'Text', with: 'You are kinda weird, you know that?'
    click_on 'Submit'
    expect(page).to have_content 'updated'
  end
end
