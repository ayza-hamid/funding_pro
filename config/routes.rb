Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
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
      get 'edit_template'
      patch 'update_template'
    end
    collection do
      get 'export_pdf_file', defaults: { format: 'pdf' }
      get 'export_docx_file'
    end
  end

  resources :templates

  resources :cash_accounts do
    put 'update_template', to: 'cash_accounts#update_template'
    member do
      get 'export_pdf'
      get 'export_docx'
      get 'export_fillable_pdf'
      get 'edit_template'
      patch 'update_template'
    end
    collection do
      get 'export_pdf_file', defaults: { format: 'pdf' }
      get 'export_docx_file'
    end
  end
end
