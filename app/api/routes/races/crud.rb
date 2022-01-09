# frozen_string_literal: true

class Api::Routes::Races::Crud < Grape::API
  RACE_ATTRIBUTES = %i[distance duration].freeze

  namespace :races do
    get { current_user.races }

    params do
      requires :duration, type: Integer
      requires :distance, type: Integer
    end
    post do
      Race.new(user_id: current_user.id, **params.slice(*RACE_ATTRIBUTES)).save
    end

    params do
      requires :race_id, type: Integer
      optional :duration, type: Integer
      optional :distance, type: Integer
    end
    put do
      current_user.races.find(params[:race_id]).tap do |race|
        race.assign_attributes(params.slice(*RACE_ATTRIBUTES))
        race.save
      end
    end

    params do
      requires :race_id, type: Integer
    end
    delete { current_user.races.find(params[:race_id]).delete }
  end
end
