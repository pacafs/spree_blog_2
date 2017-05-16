Spree::Core::Engine.add_routes do

    scope '/blog' do
      resources :posts, only: [:index, :show]
    end
      
    namespace :admin, path: Spree.admin_path do
      scope '/blog' do
        resources :posts
      end
    end

    get '/blog', to: 'posts#index'
    get '/admin/blog', to: 'admin/posts#index'

end
