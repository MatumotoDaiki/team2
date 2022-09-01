module Fixture::Stage1
  class Beam1 < Sprite
    def initialize(x, y, yspeed, xspeed)
      self.x = x
      self.y = y
      @speedx = xspeed
      @speedy = yspeed
      if @speedy < 0
        image = Image.load("images/player.png")
      else
        image = Image.load("images/enemy_ballet.png")
      end
      self.image = image
      self.image.set_color_key(C_WHITE)
    end

    def update
      self.y += @speedy
      self.x += @speedx
      self.draw
    end

  end
end