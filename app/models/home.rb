class Home
  include ActiveModel::Validations
  include ActiveModel::Conversion
  include PortlandMaps::PortlandMapsApi
  include Zillow::ZillowApi
  extend ActiveModel::Naming

  attr_accessor :address

  validates :address, presence: true
  # # validates :address do |record, attr, value|
  # #   record.errors.add attr, "starts with z." if value.start_with?("z")
  # # end

  FOOSTIMATE_CONSTANT = 1.069

  def initialize(address="")
    @address = address
  end

  def persisted?
    false
  end

  def owner
    get_homeowner(address)
  end

  def full_address
    get_full_address(address)
  end

  def lot_size
    get_lot_size(address)
  end

  def lot_zoning
    get_lot_zoning(address)
  end

  def market_value
    market_value ||= get_market_value(address)
  end

  def real_market_value
    get_real_market_value(address)
  end

  def property_taxes
    get_property_taxes(address)
  end

  def size
    get_home_size(address)
  end

  def foundation_type
    get_foundation_type(address)
  end

  def year_built
    get_year_built(address)
  end

  def neighborhood
    get_neighborhood(address)
  end

  def zestimate
    location_coordinates ||= get_location_coordinates(address)
    zestimate ||= get_zestimate(location_coordinates, address)

    zestimate.nil? ? " n/a" : zestimate
  end

  def foostimate
    if zestimate != " n/a"
      z = zestimate.gsub(",","").to_i
      m = market_value.gsub(",","").to_i

      foostimate = ((z + m * 3) / 4) * FOOSTIMATE_CONSTANT
      foostimate.to_i.to_s.reverse.scan(/.{1,3}/).join(',').reverse
    else
      " n/a"
    end
  end
end
