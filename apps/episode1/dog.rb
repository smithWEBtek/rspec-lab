class Dog

  def initialize(hunger_level: 0)
    @hunger_level = hunger_level
  end

  def hunger_level=(level)
    @hunger_level = level
  end

  def hunger_level
    @hunger_level
  end

  def hungry?
    @hunger_level > 5
  end

  def feed
    @hunger_level = 0
  end

  def bark
    'Woof!'
  end

  def run_on_beach
    self.hunger_level += 4
  end

  def walk_in_the_park
    self.hunger_level += 2
  end
end
