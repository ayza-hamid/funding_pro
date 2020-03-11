Rails.application.routes.draw do
  root to: 'dashboard#home'

  resources :users do
    collection do
      get 'export_pdf_file', defaults: { format: 'pdf' }
      get 'export_docx_file'
    end
  end

  resources :investment_accounts do
    member do
      get 'export_pdf'
      get 'export_docx'
      get 'export_fillable_pdf'
    end
    collection do
      get 'export_pdf_file', defaults: { format: 'pdf' }
      get 'export_docx_file'
    end
  end

  resources :cash_accounts do
    member do
      get 'export_pdf'
      get 'export_docx'
      get 'export_fillable_pdf'
    end
    collection do
      get 'export_pdf_file', defaults: { format: 'pdf' }
      get 'export_docx_file'
    end
  end
end
