# require 'test_helper'
#
#
# describe Channel do
#   it 'will raise ArgumentError if created with less than 2 params' do
#     expect {
#       Channel.new #new channel without params
#     }.must_raise ArgumentError
#
#     expect {
#       Channel.new('nodes') #new channel without an id
#     }.must_raise ArgumentError
#   end
#
#   it 'can be created with a name and id' do
#     my_channel = Channel.new('nodes', '12345')
#     expect {my_channel.name}.must_equal 'nodes'
#     expect {my_channel.id}.must_equal '12345'
#   end
#
#   it 'can be created with optional parameters' do
#
#     purpose1 = {
#       "value": "Talk about adoptsy!",
#       "creator": "UB8471T4Z",
#       "last_set": 1539800365
#     }
#     members = ['string','string2']
#
#     my_channel = Channel.new('edges', '412', purpose1, members, is_archived, is_general)
#
#
#     expect {my_channel.name}.must_equal 'nodes'
#     expect {my_channel.id}.must_equal '12345'
#     expect {my_channel.purpose}.must_equal purpose1
#     expect {my_channel.is_archived}.must_equal true
#     expect {my_channel.is_general}.must_equal false
#     expect {my_channel.members}.must_equal members
#
#   end
#
# end #end of channell describe block
