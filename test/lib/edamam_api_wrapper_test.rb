# require 'test_helper'
#
# describe SlackApiWrapper do
#   it 'can list channels' do
#     #list_channels_file is the name of the cassette file
#     #this is where the list_channels_file is made..by calling .use_cassette
#     VCR.use_cassette('list_channels_file') do
#       #its only going to call the API once and then if the
#       channels = SlackApiWrapper.list_channels
#
#       expect(channels.length).must_be :>, 0
#       channels.each do |channel|
#         expect(channel).must_respond_to :name
#         expect(channel).must_respond_to :id
#       end
#     end
#   end
#
#   it 'can send messages to valid channels' do
#     VCR.use_cassette('send_msg_file') do
#       worked = SlackApiWrapper.send_msg('nodes-api-testing', 'test message here!')
#
#       expect(worked).must_equal true
#     end
#   end
#
#   it 'cannt send messages to invalid channels' do
#     VCR.use_cassette('send_msg_file') do
#       worked = SlackApiWrapper.send_msg('bogus-fake-testing', 'test message here!')
#
#       expect(worked).must_equal false
#     end
#   end
#
#
# end  #end of slackapi wrapper block
