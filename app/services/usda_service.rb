class USDAService

  def self.search(term)
    # tolerate a single term first
    # refactor for multiple terms with a space parsing helper? replace term with output?
    get_url "/fdc/v1/foods/search?api_key=#{ENV['usda_key']}&query=#{term}"
  end

  def self.get_url(url)
    connection = Faraday.new("https://api.nal.usda.gov")
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
