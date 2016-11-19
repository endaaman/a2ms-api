Rails.application.routes.draw do
  scope '/api' do
    get '/', to: 'index#index'

    namespace :session, defaults: { format: :json } do
      get '/', action: 'index'
      post '/', action: 'create'
    end

    constraints id: /\d+/ do
      namespace :users, defaults: { format: :json } do
        get '/', action: 'index'
        post '/', action: 'create'
        delete '/:id', action: 'destroy'
        post '/:id/approval', action: 'approve'
        delete '/:id/approval', action: 'reject'
      end

      namespace :categories, defaults: { format: :json } do
        get '/', action: 'index'
        post '/', action: 'create'
        patch '/:id', action: 'update'
        delete '/:id', action: 'destroy'
      end

      namespace :articles, defaults: { format: :json } do
        get '/', action: 'index'
        post '/', action: 'create'
        patch '/:id', action: 'update'
        delete '/:id', action: 'destroy'
      end

      namespace :newss, defaults: { format: :json } do
        get '/', action: 'index'
        post '/', action: 'create'
        patch '/:id', action: 'update'
        delete '/:id', action: 'destroy'
      end
    end

    constraints filename: /.*/ do
      namespace :files, defaults: { format: :json } do
        get '/', action: 'index'
        post '/', action: 'create'
        post '/rename', action: 'rename'
        delete '/:filename', action: 'destroy'
      end
    end
 end
end
