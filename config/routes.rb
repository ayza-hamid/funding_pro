Rails.application.routes.draw do
  root to: 'dashboard#home'

  resources :users do
    collection do
      get 'generate_pdf_file', defaults: { format: 'pdf' }
      get 'generate_docx_file'
    end
  end

  resources :investment_accounts do
    member do
      get 'generate_pdf'
      get 'generate_docx'
      get 'generate_fillable_pdf'
    end
    collection do
      get 'generate_pdf_file', defaults: { format: 'pdf' }
      get 'generate_docx_file'
    end
  end

  resources :cash_accounts do
    member do
      get 'generate_pdf'
      get 'generate_docx'
      get 'generate_fillable_pdf'
    end
    collection do
      get 'generate_pdf_file', defaults: { format: 'pdf' }
      get 'generate_docx_file'
    end
  end
end
