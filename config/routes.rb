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

      get 'contests/m-1gp', to: 'contests#m_1gp'
      get 'contests/king-of-conte', to: 'contests#king_of_conte'
      get 'contests/r-1gp', to: 'contests#r_1gp'

      get 'finalists(/:id)', to: 'finalists#index'
    end
  end
end
