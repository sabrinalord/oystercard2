class JourneyLog
    
    attr_reader :journey_list
        def initialize(journey = Journey.new)
          @journey_list = []
          @journey = journey
        end
      end
end

