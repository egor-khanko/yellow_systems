# frozen_string_literal: true

class Api::Routes::Races::Stats < Grape::API
  namespace 'races/stats' do
    get :by_week do
      ::Races::Stats.new(current_user).by_week
    end
  end
end
