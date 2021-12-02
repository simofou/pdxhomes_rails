module WalkScore::WalkScoreApi
  require 'active_record'
  require 'faraday'
  require 'pry'
  require 'json'
  require 'active_support/core_ext/numeric/conversions'
  require 'dotenv/load'

  API_KEY = ENV['WALK_SCORE_API_KEY']

  def get_response(location_coordinates, full_address)
    url =  "https://api.walkscore.com/score"
    lon = location_coordinates.split(',').first 
    lat = location_coordinates.split(',').second
    url_address = CGI.escape full_address

    @response ||= Faraday.get(url) do |req|
      req.params['wsapikey'] = API_KEY 
      req.params['lat'] = lat
      req.params['lon'] = lon
      req.params['address'] = url_address 
      req.params['transit'] = 1
      req.params['bike'] = 1
    end

    Hash.from_xml(@response.body)
  end

  def get_walk_score(location_coordinates, full_address)
    response_body = get_response(location_coordinates, full_address)
    response_body["result"]["walkscore"]
  end

  def get_walk_score_help_link(location_coordinates, full_address)
    response_body = get_response(location_coordinates, full_address)
    response_body["result"]["help_link"]
  end
end
