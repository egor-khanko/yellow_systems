# frozen_string_literal: true

class Races::Stats
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def by_week
    avg_distances.map do |week, _|
      [
        week,
        { average_speed: avg_speeds[week],
          average_duration: avg_durations[week],
          total_distance: total_distances[week] }
      ]
    end.to_h
  end

  private

  def total_distances
    @total_distances = races_by_week.sum(:distance)
  end

  def avg_speeds
    @avg_speeds ||= avg_distances.each_with_object({}) do |(week, distance), memo|
      memo[week] = (distance / avg_durations[week]).round(2)
    end
  end

  def avg_durations
    @avg_durations ||= races_by_week.average(:duration).transform_values(&:to_i)
  end

  def avg_distances
    @avg_distances ||= races_by_week.average(:distance)
  end

  def races_by_week
    @races_by_week ||= user.races.group("DATE_TRUNC('week', created_at)")
  end
end
