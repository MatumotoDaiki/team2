module Fixture::MainGame
  class Beam < Sprite
    def initialize(x, y, speed, image)
      self.x = x
      self.y = y
      @speed = speed
      self.image = image
      self.image.set_color_key(C_WHITE)
    end

    def update
      p self.y
      self.y += @speed
      if self.y >= -10||Sprite.check(@bullets, Enemy.collection)
        self.draw
      else
        @bullets = 0
      end
      if Sprite.check(@bullets, Enemy.collection)
        @score += 1
      end
    end
  end
end