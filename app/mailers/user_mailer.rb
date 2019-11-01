class UserMailer < ApplicationMailer
  default from: 'no-reply@the-gossip-project'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://the-gossip-project-gaspard.herokuapp.com/sessions/new' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Welcome to The Gossip Project!') 
  end
end
