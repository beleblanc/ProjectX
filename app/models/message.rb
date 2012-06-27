class Message < ActiveRecord::Base
  attr_accessible :message, :role, :user_id
  after_create :push_message

  belongs_to :user

  private

  def push_message
    if self.user.roles.where('name = ?', "doctor").any?
      PrivatePub.publish_to "/messages/#{self.role}", :chat_message => "#{self.message} - Dr. #{self.user.username}"
    else
      PrivatePub.publish_to "/messages/#{self.role}", :chat_message => "#{self.message}"
    end
  end

end
