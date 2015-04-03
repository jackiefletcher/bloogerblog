require 'rails_helper'

describe 'delete comment process', vcr: true do
  it 'will delete a comment' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    post = FactoryGirl.create(:post)
    visit post_path(post)
    click_on 'Comment'
    fill_in 'Text', with: 'That is so cool!'
    click_on 'Submit'
    click_on 'Delete Comment'
    expect(page).to have_content 'deleted'
  end
end
