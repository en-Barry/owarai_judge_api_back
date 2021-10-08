Rails.application.routes.draw do
  root 'application#root'
  namespace 'api' do
    namespace 'v1' do
      resources :judgements do
        collection do
          get '(/:id)', to: 'judgements#results'
        end
      end

      get 'contests(/:id)', to: 'contests#index'

      get 'finalists(/:id)', to: 'finalists#index'
    end
  end
end
