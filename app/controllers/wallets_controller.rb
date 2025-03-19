class WalletsController < ApplicationController
  before_action :authenticate_user!
  
  def connect
    # Logique pour connecter un portefeuille Solana
    # Cette fonction sera implémentée plus tard avec l'intégration Solana
    
    if params[:wallet_address].present?
      current_user.update(wallet_address: params[:wallet_address])
      render json: { success: true, message: "Portefeuille connecté avec succès." }
    else
      render json: { success: false, message: "Adresse de portefeuille non fournie." }, status: :unprocessable_entity
    end
  end
  
  def disconnect
    # Déconnecter le portefeuille
    current_user.update(wallet_address: nil)
    render json: { success: true, message: "Portefeuille déconnecté avec succès." }
  end
  
  def verify
    # Vérifier une signature pour prouver la propriété du portefeuille
    # Cette fonction sera implémentée plus tard avec l'intégration Solana
    
    if params[:signature].present? && params[:message].present?
      # Logique de vérification de signature Solana
      render json: { success: true, message: "Signature vérifiée avec succès." }
    else
      render json: { success: false, message: "Paramètres de vérification incomplets." }, status: :unprocessable_entity
    end
  end
end