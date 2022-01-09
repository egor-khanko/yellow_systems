# frozen_string_literal: true

class Api::Routes::Races::Crud < Grape::API
  RACE_ATTRIBUTES = %i[distance duration].freeze

  namespace :races do
    desc 'Get all races for user', is_array: true
    get { current_user.races }

    desc 'Create new race for user'
    params do
      requires :duration, type: Integer
      requires :distance, type: Integer
    end
    post do
      race = Race.new(user_id: current_user.id, **params.slice(*RACE_ATTRIBUTES)).save
      present race, with: Entities::Races
    end

    desc 'Update race params'
    params do
      requires :race_id, type: Integer
      optional :duration, type: Integer
      optional :distance, type: Integer
    end
    put ':race_id' do
      race = current_user.races.find(params[:race_id])
      race.assign_attributes(params.slice(*RACE_ATTRIBUTES))
      present race.save, with: Entities::Racess
    end

    desc 'Delete race'
    params do
      requires :race_id, type: Integer
    end
    delete ':race_id' do
      present current_user.races.find(params[:race_id]).delete, with: Entities::Races
    end
  end
end
