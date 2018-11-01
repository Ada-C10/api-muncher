require 'test_helper'

describe SlackApiWrapper do
  it 'can list channels' do
    VCR.use_cassette('list_channels_file') do
      channels = SlackApiWrapper.list_channels # this makes an API call
      # and checks list_channels_file to see if has made the call before
      # the first time, no, so it makes the call and saves it in the file
      # the second time, it has seen it before so it won't make the request
      # instead, it'll replay the saved data

      expect(channels.length).must_be :>, 0
      channels.each do |channel|
        expect(channel).must_respond_to :name
        expect(channel).must_respond_to :id
      end
    end
  end

  it 'can send messages to valid channels' do
    VCR.use_cassette('send_msg') do
      worked = SlackApiWrapper.send_msg('test-api-channel', 'THIS IS JACKIE IN TESTING')

      expect(worked).must_equal true
    end
  end

  it 'cannot send messages to invalid channels' do
    VCR.use_cassette('send_msg') do
      worked = SlackApiWrapper.send_msg('really-bogus-api-testing', 'THIS IS JACKIE IN TESTING')

      expect(worked).must_equal false
    end
  end
end
