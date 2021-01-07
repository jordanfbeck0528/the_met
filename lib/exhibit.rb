class Exhibit
  attr_reader :name, :cost
  def initialize(exhibit_data)
    @name = exhibit_data[:name]
    @cost = exhibit_data[:cost]
  end
end
