require_relative "./journey.rb"

class JourneyLog
    
  attr_reader :journey_list, :journey

  def initialize(journey_class = Journey)
    @journey_list = []
    @journey_class = journey_class
  end

  def start(entry_station)
    current_journey # Invoking method below
    @current_journey.save_entry_station(entry_station)
    @journey_list << @current_journey
  end

  def finish(exit_station)
    current_journey
    @current_journey.save_exit_station(exit_station)
    @current_journey = nil
  end

  private 

  def current_journey
    @current_journey ||= @journey_class.new
    # if @journey 
    #   return @journey
    # elsif @journey == false
    #   @journey = @journey_class.new
    # end
  end


end

