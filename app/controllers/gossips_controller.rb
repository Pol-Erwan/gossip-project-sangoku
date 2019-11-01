class GossipsController < ApplicationController
  include GossipsHelper
  before_action :require_login, only: [:new, :create, :edit, :destroy]


  def index
    @gossips = Gossip.all
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
  end

  def show
    @comments = Comment.all
    @gossip = Gossip.find(params[:id])
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
  end

  def new
    @gossip = Gossip.new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create
  @gossip = Gossip.new(title: params[:title], content: params[:content], user: current_user)
  if @gossip.save
    flash[:success] = "Gossip created!"
    redirect_to root_path
  else
    render :new
  end
  end

  def edit
    @gossip = Gossip.find(params[:id]) 

    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      flash[:success] = 'The Gossip was successfully edited'
      redirect_to @gossip
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    flash[:success] = 'The Gossip was successfully destroyed'
    redirect_to gossips_path
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end

  def require_login
    unless session[:user_id]
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_session_path # halts request cycle
    end
  end


end