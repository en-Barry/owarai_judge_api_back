Rails.application.routes.draw do
  root 'application#root'
  namespace 'api' do
    namespace 'v1' do
      resources :judgements do
        collection do
          get 'm-1gp(/:id)', to: 'judgements#m_1gp'
          get 'king-of-conte(/:id)', to: 'judgements#king_of_conte'
          get 'r-1gp(/:id)', to: 'judgements#r_1gp'
        end
      end

      get 'contests(/:id)', to: 'contests#index'

      get 'finalists(/:id)', to: 'finalists#index'
    end
  end
end
