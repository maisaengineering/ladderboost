class Message
  include Mongoid::Document
  field :message, type: String
  field :message_type, type: String
  belongs_to :user
end
