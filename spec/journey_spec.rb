require 'journey'

describe Journey do 

    it 'checks if the person is on a journey' do
        expect(subject.in_journey?).to be(false)
    end

end