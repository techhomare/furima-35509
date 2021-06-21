class MessagesController < ApplicationController

  def create
    @message = Message.new(text: params[:message][:text])
    @message.save
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    end
  end
end
