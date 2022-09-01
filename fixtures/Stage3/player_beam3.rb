module Fixture::Stage3
  class Player_Beam3_1 < Sprite
    def initialize(x, y)
      super
      self.x = x
      self.y = y
      self.image = Image.new(3, 5, C_YELLOW)
    end

    def update
      self.y -= 10
      self.draw
    end
  end

  class Player_Beam3_2 < Sprite
    def initialize(x, y)
      super
      self.x = x
      self.y = y
      self.image = Image.new(3, 5, C_YELLOW)
    end

    def update
      self.y -= 7
      self.x += 4
      self.draw
    end
  end
  class Player_Beam3_3 < Sprite
    def initialize(x, y)
      super
      self.x = x
      self.y = y
      self.image = Image.new(3, 5, C_YELLOW)
    end

    def update
      self.y -= 7
      self.x -= 4
      self.draw
    end
  end
  class Player_Beam3_4 < Sprite
    def initialize(x, y)
      super
      self.x = x
      self.y = y
      self.image = Image.new(3, 5, C_YELLOW)
    end

    def update
      self.y -= 8
      self.x += 2
      self.draw
    end
  end
  class Player_Beam3_5 < Sprite
    def initialize(x, y)
      super
      self.x = x
      self.y = y
      self.image = Image.new(3, 5, C_YELLOW)
    end

    def update
      self.y -= 8
      self.x -= 2
      self.draw
    end
  end
end
