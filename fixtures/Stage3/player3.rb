module Fixture::Stage3
  class Player3 < Sprite
    attr_reader :beams, :health
    def initialize
      @images = [Image.load("images/player3_1.png"),Image.load("images/player3_2.png"),Image.load("images/player3_3.png")]
      @beams = []
      @count = 0
      @health = 3
      @speed = 5
      @beam_timer = 0
      self.x = Window.width / 2
      self.y = Window.height / 2 - @images[0].width
      self.image = @images[1]
    end

    def update
      image
      move
      shot
      @count += 1
      self.draw
    end

    def image
      case @count / 10
      when 0 then
        self.image = @images[0]
      when 1 then
        self.image = @images[1]
      when 2 then
        self.image = @images[2]
      when 3 then
        self.image = @images[0]
        @count = 0
      end
    end

    def hit
      @health -= 1
    end
    def isdead
      @health <= 0
    end

    def move
      if Input.key_down?(K_A)
        self.x -= @speed
      elsif Input.key_down?(K_D)
        self.x += @speed
      end

      if Input.key_down?(K_W)
        self.y -= @speed
      elsif Input.key_down?(K_S)
        self.y += @speed
      end

      # Protrusion prevention
      if self.x < 0
        self.x = 0
      elsif self.x > Window.width - self.image.width
        self.x = Window.width - self.image.width
      end

      if self.y < 0
        self.y = 0
      elsif self.y > Window.height - self.image.height
        self.y = Window.height - self.image.height
      end
    end
    def shot
      @beam_timer += 1
      if Input.key_down?(K_SPACE) && @beam_timer >= 5
        @beams << Player_Beam3_1.new(self.x, self.y)
        @beams << Player_Beam3_1.new(self.x + self.image.width, self.y)
        @beams << Player_Beam3_2.new(self.x + self.image.width, self.y)
        @beams << Player_Beam3_3.new(self.x, self.y)
        @beams << Player_Beam3_4.new(self.x + self.image.width, self.y)
        @beams << Player_Beam3_5.new(self.x, self.y)
        @beam_timer = 0
      end
      @beams.length.times do |n|
        if @beams[n]
          beams[n].update
          if @beams[n].y < 0
            del(n)
          end
        end
      end
    end
    def del(num)
      @beams.delete_at(num)
    end
  end
end