Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :judgements
      get 'contests/m-1gp', to: 'contests#m_1gp'
      get 'contests/king_of_conte', to: 'contests#king_of_conte'
      get 'contests/r-1gp', to: 'contests#r_1gp'

      get 'finalists/m-1gp', to: 'finalists#m_1gp'
      get 'finalists/king_of_conte', to: 'finalists#king_of_conte'
      get 'finalists/r-1gp', to: 'finalists#r_1gp'
    end
  end
end
