class Validation
  attr_reader :input
  def initialize(input)
    @input = input
  end

  def is_word?
    service.response.status == 200
  end

  def root
    service.results[:lexicalEntries].first[:inflectionOf].first[:id]
  end

  private

  def service
    @service ||= OxfordService.new(input)
  end

end
