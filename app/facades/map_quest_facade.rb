class MapQuestFacade
  def self.get_travel_time(origin, destination)
    MapQuestService.get_travel_time(origin, destination)
  end
end