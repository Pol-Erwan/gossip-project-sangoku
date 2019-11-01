module LikesHelper
  def current_user
    User.find_by(id: session[:user_id])
  end

  def author
    User.find(gossip.user_id)
  end
end
