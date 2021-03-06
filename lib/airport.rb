class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :planes, :capacity
  attr_writer :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    raise 'Airport full' if full?
    raise 'Plane has already landed' if @planes.include?(plane)
    raise 'Cannot land because of stormy weather' if @weather.stormy?
    @planes << plane
  end

  def take_off(plane)
    raise 'Cannot take off because of stormy weather' if @weather.stormy?
    raise 'Plane is not at this airport' unless @planes.include?(plane)
    @planes.delete(plane)
  end

  def contains?(plane)
    @planes.include?(plane)
  end

  private

  def full?
    @planes.count >= capacity
  end

end
