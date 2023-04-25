class ActivityFacade

  def self.get_activities(location)
    activities = ActivityService.get_activities(location)

    activities.map do |activity|
      # require 'pry'; binding.pry
    end
  end
end