Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :judgements
      get 'contests/m-1gp', to: 'contests#m_1gp'
      get 'contests/king', to: 'contests#king_of_conte'
      get 'contests/r-1gp', to: 'contests#r_1gp'
    end
  end
end
