require 'station'

describe Station do

   subject {
       described_class.new(name: "Commercial Street", zone: 1)
    }

    it 'knows its name' do
        subject.zone = 1
        expect(subject.name).to eq("Commercial Street")
    end

    it 'knows its zone' do
        subject.name = 'test'
        expect(subject.zone).to eq(1)
    end
end