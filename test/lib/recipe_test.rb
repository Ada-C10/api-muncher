require 'test_helper' # load in minitest, etc.

describe Channel do
  it 'will raise an ArgumentError if created without required arguments' do
    expect {
      Channel.new
    }.must_raise ArgumentError

    expect {
      Channel.new 'nodes'
    }.must_raise ArgumentError
  end

  it 'can be created with a name and id' do
    myChannel = Channel.new('nodes', '12345')

    expect(myChannel.name).must_equal 'nodes'
    expect(myChannel.id).must_equal '12345'
  end

  it 'can be created with optional arguments' do
    myChannel = Channel.new('nodes', '12345', { purpose: 'fun', is_archived: false, is_general: true, members: ['1', '2', '3'] })

    expect(myChannel.name).must_equal 'nodes'
    expect(myChannel.id).must_equal '12345'
    expect(myChannel.purpose).must_equal 'fun'
    expect(myChannel.is_archived).must_equal false
    expect(myChannel.is_general).must_equal true
    expect(myChannel.members).must_equal ['1', '2', '3']
  end
end
