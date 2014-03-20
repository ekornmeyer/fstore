class OrderLine < ActiveRecord::Base
  validates :Quantity, numericality: true

  def self.valid_attribute?(attr, value)
    mock = self.new(attr => value)
    unless mock.valid?
      return (not mock.errors.has_key?(attr))
    end
    true
  end

end
