Rails.application.routes.draw do
  root to: 'dashboard#home'

  resources :users do
    collection do
      get 'generate_pdf_file', defaults: { format: 'pdf' }
    end
    collection do
      get 'generate_docx_file'
    end
  end

  resources :investment_accounts do
    member do
      get 'generate_pdf'
    end
    collection do
      get 'generate_pdf_file', defaults: { format: 'pdf' }
    end
    collection do
      get 'generate_docx_file'
    end
  end

  resources :cash_accounts do
    member do
      get 'generate_pdf'
    end
    collection do
      get 'generate_pdf_file', defaults: { format: 'pdf' }
    end
    collection do
      get 'generate_docx_file'
    end
  end
end
