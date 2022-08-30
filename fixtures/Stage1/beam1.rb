module Fixture::Stage1
  class Beam1 < Sprite
    def initialize(x, y, isplayer)
      self.x = x
      self.y = y
      if isplayer
        @speed = -3
        image = Image.load("images/player.png")
      else
        @speed = 3
        image = Image.load("images/enemy_ballet.png")
      end
      self.image = image
      self.image.set_color_key(C_WHITE)
    end

    def update
      self.y += @speed
      self.draw
    end
  end
end