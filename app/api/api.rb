# frozen_string_literal: true

class Api < Grape::API
  format :json

  auth :grape_devise_token_auth, resource_class: :user
  helpers GrapeDeviseTokenAuth::AuthHelpers

  namespace do
    before { authenticate_user! }

    mount Api::Routes::Races::Crud
    mount Api::Routes::Races::Stats

    get do
      { hello: :world! }
    end
  end

  add_swagger_documentation \
    security_definitions: {
      access_token: {
        type: 'apiKey',
        name: 'access-token',
        in: 'header'
      },
      client: {
        type: 'apiKey',
        name: 'client',
        in: 'header'
      },
      uid: {
        type: 'apiKey',
        name: 'uid',
        in: 'header'
      }
    },
    security: [
      { access_token: [] },
      { client: [] },
      { uid: [] }
    ],
    schemes: %w[http https]
end
