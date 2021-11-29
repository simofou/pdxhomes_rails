class Address
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :number, :street_prefix, :street

  validates :number, presence: true, numericality: { only_integer: true, message: "addy begings with a number" }
  validates :street_prefix, presence: true, format: { with: /\A[a-zA-Z]+\z/}
  validates :street, presence: true, format: { with: /\A[a-zA-Z]+\z/}

  def initialize(number, street_prefix, street)
    @number = number
    @street_prefix =street_prefix
    @street = street 
  end

  def persisted?
    false
  end
end


# 1605 SE 36th ave apt #3
# 8728 N Edison st
# 37 El Camino dr
