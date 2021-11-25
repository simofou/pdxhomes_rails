class Home
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :address

  validates :address, :presence => true
  # # validates :address do |record, attr, value|
  # #   record.errors.add attr, "starts with z." if value.start_with?("z")
  # # end
  # basic validations
  # add a form validation that makes sure it's a real pdx address

  def initialize(address="")
    @address = address
  end

  def persisted?
    false
  end

  def owner
    PortlandMaps::PortlandMapsApi.get_homeowner(address)
  end

  def full_address
    PortlandMaps::PortlandMapsApi.get_full_address(address)
  end

  def lot_size
    PortlandMaps::PortlandMapsApi.get_lot_size(address)
  end

  def lot_zoning
    PortlandMaps::PortlandMapsApi.get_lot_zoning(address)
  end

  def market_value
    PortlandMaps::PortlandMapsApi.get_market_value(address)
  end

  def real_market_value
    PortlandMaps::PortlandMapsApi.get_real_market_value(address)
  end

  def property_taxes
    PortlandMaps::PortlandMapsApi.get_property_taxes(address)
  end

  def size
    PortlandMaps::PortlandMapsApi.get_home_size(address)
  end

  def foundation_type
    PortlandMaps::PortlandMapsApi.get_foundation_type(address)
  end

  def year_built
    PortlandMaps::PortlandMapsApi.get_year_built(address)
  end

  def neighborhood
    PortlandMaps::PortlandMapsApi.get_neighborhood(address)
  end

  def zestimate
    location_coordinates = PortlandMaps::PortlandMapsApi.get_location_coordinates(address)
    Zillow::ZillowApi.get_zestimate(location_coordinates, address)
  end
end
