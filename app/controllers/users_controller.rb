class UsersController < ApplicationController
    
  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
  end

  def show
    @gossips = Gossip.all
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create
    city = City.find_or_create_by(name: params[:city], zip_code: params[:zip_code])
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], city: city, description: params[:description], age: params[:age], email: params[:email], password: params[:password],password_confirmation: params[:password_confirmation], city_id: City.last.id) # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    if @user.save # essaie de sauvegarder en base @gossip
      flash[:success] = 'The Profile was successfully created'
      redirect_to  gossips_path # si ça marche, il redirige vers la page d'index du site
    else
      render :new # sinon, il render la view new (qui est celle sur laquelle on est déjà)
    end
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end




end