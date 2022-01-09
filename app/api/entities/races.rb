# frozen_string_literal: true

class Api::Entities::Races < Grape::Entity
  expose :distance, documentation: { type: Integer, desc: 'Distance covered during race' }
  expose :duration, documentation: { type: Integer, desc: 'Duration of the race in seconds' }
end
