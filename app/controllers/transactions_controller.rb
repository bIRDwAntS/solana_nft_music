class TransactionsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @transactions = current_user.sales.or(current_user.purchases).order(created_at: :desc).page(params[:page]).per(20)
  end
  
  def show
    @transaction = Transaction.find(params[:id])
    
    # S'assurer que l'utilisateur est impliqué dans cette transaction
    unless @transaction.seller == current_user || @transaction.buyer == current_user
      redirect_to transactions_path, alert: "Non autorisé."
    end
  end
  
  def create
    # Cette méthode sera implémentée plus tard avec l'intégration Solana
    # Elle gérera la création d'une transaction pour l'achat d'un NFT
    
    # Paramètres attendus : album_id ou track_id, amount
    @transaction = Transaction.new(
      seller_id: params[:seller_id],
      buyer_id: current_user.id,
      album_id: params[:album_id],
      track_id: params[:track_id],
      amount: params[:amount],
      transaction_type: :primary_sale,
      status: :pending
    )
    
    if @transaction.save
      # Logique pour initier la transaction Solana
      redirect_to @transaction, notice: "Transaction initiée. Veuillez confirmer dans votre portefeuille Solana."
    else
      redirect_back fallback_location: root_path, alert: "Erreur lors de la création de la transaction."
    end
  end
end