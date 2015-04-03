require 'rails_helper'

describe Message, vcr: true do
  it "doesn't save the comment if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '1111111', :from => '5038365278')
    message.save.should be false
  end
  it 'adds an error if the to number is invalid' do
   message = Message.new(:body => 'hi', :to => '1111111', :from => '5038365278')
   message.save
   message.errors.messages[:base].should eq ["The 'To' number 1111111 is not a valid phone number."]
 end
end
