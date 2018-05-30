require 'rails_helper'

describe OxfordService do
  context 'attributes' do
    describe "response status" do
      it "returns the 200 for a valid word" do
        VCR.use_cassette("oxford_service") do
          service = OxfordService.new('foxes')

          expect(service.response.status).to eq 200
        end
      end
      it 'returns 404 if invalid word' do
        VCR.use_cassette("invalidate_non_word") do
          service = OxfordService.new('foxez')

          expect(service.response.status).to eq 404
        end
      end
      it 'returns more specific results' do
        VCR.use_cassette("oxford_service") do

          service = OxfordService.new('foxes')

          expect(service.results[:id]).to eq('foxes')
        end
      end
    end
  end
end
