module Fixture::Stage3
  class Enemy_Beam3_1 < Sprite
    def initialize(x, y, angle)
      self.x = x
      self.y = y
      colors = [C_RED, C_YELLOW, C_BLUE, C_GREEN]
      self.image = Image.new(10, 10, colors[rand(5)])
      @speed = 6
      @angle = angle
    end

    def update
      self.x += @speed * Math.cos(@angle)
      self.y += @speed * Math.sin(@angle) * -1
      self.draw
    end
  end

  class Enemy_Beam3_2 < Sprite
    def initialize(x, y)
      self.x = x
      self.y = y
      self.image = Image.new(@size, @size, C_YELLOW)
    end

    def update
      if @size == 30
        angle_x = Math.atan2()
      else
        @size += 1
        self.image = Image.new(@size, @size, C_YELLOW)
      end
    end
  end
end
