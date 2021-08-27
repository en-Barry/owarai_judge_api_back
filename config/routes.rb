Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :contests
    end
  end
end
