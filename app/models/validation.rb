class Validation
  attr_reader :input
  def initialize(input)
    @input = input
    @conn = Faraday.new(url: "https://od-api.oxforddictionaries.com/api/v1/") do |faraday|
      faraday.headers["app_id"] = ENV["app_id"]
      faraday.headers["app_key"] = ENV["app_key"]
      faraday.adapter  Faraday.default_adapter
    end
  end

  def is_word?
    response.status == 200
  end

  def root
    results = JSON.parse(response.body, symbolize_names: true)[:results].first
    results[:lexicalEntries].first[:inflectionOf].first[:id]
  end

  private

  def response
    @conn.get("inflections/en/#{@input}")
  end


end
# GET /inflections/{source_lang}/{word_id} under the "Lemmatron" heading
