class Contact < ApplicationRecord
  has_many(:phones)
  def toString
    "#{self.given_name} #{self.family_name} -- #{self.email_address} -- #{self.home_address} -- #{self.phones.each do |p| p.number end}"
  end

end
