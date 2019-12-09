require './client'

RSpec.describe Client do
  subject(:fetcher) { described_class.new(zip) }

  let(:response_data) do
    OpenStruct.new(
      'zip' => '90245',
      'cbsa' => '31084',
      'msa' => nil,
      'pop2015' => nil,
      'pop2014' => nil
    )
  end

  context 'successful API call' do
    let(:zip) { 90245 }

    let(:api_response) do
      instance_double(HTTParty::Response, parsed_response: response_data, success?: true)
    end

    before do
      allow(HTTParty).to receive(:get).and_return(api_response)
    end

    it 'fetches successfully' do
      expect(subject.fetch).to eq(response_data)
    end
  end

  context 'invalid zip code length' do
    let(:zip) { 123459 }
    it 'fetches successfully' do
      expect(subject.fetch).to eq('Invalid zip code length')
    end
  end
end
