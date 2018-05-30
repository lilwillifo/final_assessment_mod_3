class OxfordService
  def initialize(input)
    @input = input
  end

  def response
    conn.get("inflections/en/#{@input}")
  end

  private

  def conn
  Faraday.new(url: "https://od-api.oxforddictionaries.com/api/v1/") do |faraday|
            faraday.headers["app_id"] = ENV["app_id"]
            faraday.headers["app_key"] = ENV["app_key"]
            faraday.adapter  Faraday.default_adapter
          end
  end

end
