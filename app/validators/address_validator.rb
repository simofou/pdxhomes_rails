class AddressValidator < ActiveModel::Validator
  def validate(record)
    if record.address.to_s.empty?
      record.errors.add :base, "address can't be blank"
    end

    if record.address =~ /^[a-z]/ || record.address =~ /^[A-Z]/
      record.errors.add :base, "address should start with a number"
    end

    if record.address.count(' ') < 2
      record.errors.add :base, "address should contain at least 1 number, 1 prefix, and 1 street name"
    end
  end
end
