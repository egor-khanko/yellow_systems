# frozen_string_literal: true

class Api < Grape::API
  format :json

  auth :grape_devise_token_auth, resource_class: :user
  helpers GrapeDeviseTokenAuth::AuthHelpers

  before do
    authenticate_user!
  end

  mount Api::Routes::Races::Crud
  mount Api::Routes::Races::Stats

  get do
    { hello: :world! }
  end
end
