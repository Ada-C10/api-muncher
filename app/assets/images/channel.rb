class Channel
  #this is a class that can represent a channel
  attr_reader :name, :id, :purpose, :is_archived, :members, :is_general

  def initialize(name, id, options = {} )
    raise ArgumentError if name == nil || name == "" || id == nil || id == ""

    @name = name
    @id = id

#we're going to package the @purpose etc into the options hash in another method
    @purpose = options[:purpose]
    @is_archived = options[:is_archived]
    @is_general = options[:is_general]
    @members = options[:members]
  end
end
