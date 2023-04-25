class Activity
  attr_reader :id, :type, :destination, :forecast

  def initialize(destination, forecast)
    @id = nil
    @type = "activities"
    @destination = destination
    @forecast = forecast
    # require 'pry'; binding.pry
  end

  def self.random_relaxation_activity
    relaxation_activities = ["meditate", "yoga", "take a nap", "read a book"]
    relaxation_activities.sample
  end

  def self.random_recreational_activity
    recreational_activities = ["go to the zoo", "go to the movies", "go to a concert", "go to a museum"]
    recreational_activities.sample
  end

  def self.random_busywork_activity
    busywork_activities = ["do a puzzle", "clean your house", "do some gardening", "do some woodworking"]
    busywork_activities.sample
  end

  def self.random_cooking_activity
    cooking_activities = ["make a new recipe", "make a cocktail", "make a dessert", "make a snack"]
    cooking_activities.sample
  end

  def get_activities
    activities = ActivityService.get_activities(@forecast)
    activities =
      { activity: activities[:activity],
        type: activities[:type],
        participants: activities[:participants],
        price: activities[:price] }
    if @forecast[:temperature] >= 60
      activities[:recreational] = Activity.random_recreational_activity
    elsif @forecast[:temperature] >= 50 && @forecast[:temperature] < 60
      activities[:busywork] = Activity.random_busywork_activity
    else @forecast[:temperature] < 50 
      activities[:cooking] = Activity.random_cooking_activity
    end
    activities[:relaxation] = Activity.random_relaxation_activity
    activities
  end
end