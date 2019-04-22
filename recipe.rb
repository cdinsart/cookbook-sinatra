class Recipe
  attr_accessor :name, :description, :time, :mark
  def initialize(name, description, time)
    @name = name
    @description = description
    @time = time
    @mark = false
  end
end
