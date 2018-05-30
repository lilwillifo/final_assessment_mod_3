require 'rails_helper'

describe OxfordService do
  context 'attributes' do
    describe "input" do
      it "returns the input" do
        VCR.use_cassette("oxford_service") do
          service = OxfordService.new('foxes')

          expect(service.response.status).to eq 200

          service = OxfordService.new('foxez')

          expect(service.response.status).to eq 404
        end
      end
    end
  end
end
