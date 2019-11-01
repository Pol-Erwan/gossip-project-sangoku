class ConversationsController < ApplicationController
  before_action :require_login

  def index
   @users = User.all
   @conversations = Conversation.all
   end

  def create
   if Conversation.between(params[:sender_id],params[:recipient_id])
     .present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
   else
    @conversation = Conversation.create!(conversation_params)
   end
   redirect_to conversation_messages_path(@conversation)
  end

  private
  
   def conversation_params
    params.permit(:sender_id, :recipient_id)
   end


    def require_login
      unless session[:user_id]
        flash[:error] = "You must be logged in to access this section"
        redirect_to new_session_path # halts request cycle
      end
    end

end