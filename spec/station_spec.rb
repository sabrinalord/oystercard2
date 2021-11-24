require 'station'

describe Station do

   subject {
       described_class.new(name: "Commercial Street", zone: 1)
    }

    # subject {described_class.new(name: "Old Street", zone: 1)}

    it 'knows its name' do
        expect(subject.name).to eq("Commercial Street")
    end

    it 'knows its zone' do
        expect(subject.zone).to eq(1)
    end
end