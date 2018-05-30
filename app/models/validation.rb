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
    response = @conn.get("inflections/en/#{@input}")
    if response.status == 200
      true
    else
      false
    end
  end

end
# JSON.parse(response.body, symbolize_names: true)[:results]
# GET /inflections/{source_lang}/{word_id} under the "Lemmatron" heading
