Rails.application.routes.draw do
  root to: 'investment_accounts#index'

  resources :users
  resources :investment_accounts do
    member do
      get 'generate_pdf'
    end
    collection do
      get 'generate_pdf_collection', defaults: { format: 'pdf' }
    end
  end
end
