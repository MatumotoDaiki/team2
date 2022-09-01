module Fixture::Stage2
  class Player2 < Sprite
    attr_accessor :health
    def initialize
      # self.x, self.y: Spriteを親に持つPlayerはattr_accessorで定義されたx, yを持つ

      # self:      Playerクラスから作られたインスタンスである自分
      # self.変数: selfの持つ変数を呼び出す (その処理はgetter/setterを呼び出す)
      # @変数:     インスタンス変数 (privateで参照可能な変数)

      self.x = x

      self.y = y
      self.image = Image.load("images/player.jpg")
      @beams = []
      @window_out = -10
      @health = 10
      self.image.set_color_key(C_WHITE)
    end

    def update
      if Input.key_down?(K_W) || Input.key_down?(K_UP) then  # Escキーで終了
        self.y -= 3
      elsif Input.key_down?(K_S) || Input.key_down?(K_DOWN) then
        self.y += 3
      elsif Input.key_down?(K_A) || Input.key_down?(K_LEFT) then
        self.x -= 3
      elsif Input.key_down?(K_D) || Input.key_down?(K_RIGHT) then
        self.x += 3
      end
      if Input.key_push?(K_SPACE)
        @beams << Beam.new(self.x,self.y,-3)
      end
      for bullet in @beams do
        if bullet.y >= @window_out
          bullet = 0
        end
      end
      @beams.each { |n| n.update }
      
      if @player.x < 0
        @player.x = 0
      elsif @player.x > Window.width
        @player.x = Window.width
      end
      
      if @player.y < 0
        @player.y = 0
      elsif @player.y > Window.height
        @player.y = Window.height
      end
    end

    def damage
      @health -= 1
    end
  end
end