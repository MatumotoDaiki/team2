module Fixture::MainGame
    class Enemy_ballet < Sprite
        def initialize(x,y,image)
            self.image = image
            self.x, self.y, = x, y
        end

    end
end