module Fixture::MainGame
  class Beam < Sprite
    def initialize(x, y)
      self.x = x
      self.y = y
      @speed = -3
      self.image = Image.load("images/player.png")
      self.image.set_color_key(C_WHITE)
    end

    def update
      self.y += @speed
      self.draw
    end
  end
end