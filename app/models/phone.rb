class Phone < ApplicationRecord
  belongs_to(:contact)

  def toString
    "#{self.number} (#{self.purpose})"
  end
end
