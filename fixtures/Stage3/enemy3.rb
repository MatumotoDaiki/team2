module Fixture::Stage3
  class Enemy3 < Sprite
    include Fixture::Stage3
    attr_reader :beams, :health
    def initialize
      @images = [Image.load("images/Enemy3_1.png"), Image.load("images/Enemy3_2.png"), Image.load("images/Enemy3_3.png")]
      @count = 0
      @health = 150
      @attack_count = 100
      @image_change_speed = 20
      self.image = @images[0]
      self.x = Window.width / 2 - @images[0].width
      self.y = @images[0].height
      @beams = []
    end

    def update
      image
      beams_update
      @count += 1
      @attack_count += 1
      if @attack_count >= 30
          attack_1
          @attack_count = 0
      end
    end

    def beams_update
      @beams.length.times do |n|
        if @beams[n]
          @beams[n].update
          if @beams[n].x < 0 || @beams[n].x > Window.width || @beams[n].y < 0 || @beams[n].y > Window.height
            del(n)
          end
        end
      end
    end
    def attack_1
      num = [1.1, 1.2,1.25, 1.3, 1.35, 1.4,1.45,1.48, 1.5,1.53, 1.55, 1.6,1.65, 1.7, 1.8, 1.9]
      for angle in num
          @beams << Enemy_Beam3_1.new(self.x, self.y, (angle + rand(-0.05..0.05)) * Math::PI)
      end
    end

    def attack_2

    end

    def attack_3

    end

    def hit
      @health -= 1
    end

    def image
      case @count / @image_change_speed
      when 0 then
        self.image = @images[0]
        self.x = Window.width / 2 - @images[0].width
      when 1 then
        self.x = Window.width / 2 - @images[1].width
        self.image = @images[1]
      when 2 then
        self.x = Window.width / 2 - @images[2].width
        self.image = @images[2]
      when 3 then
        self.x = Window.width / 2 - @images[0].width
        self.image = @images[0]
        @count = 0
      end
      self.draw
    end
    def del(num)
      @beams.delete_at(num)
    end
  end

end