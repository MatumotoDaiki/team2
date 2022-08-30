module Scene
  class MainGame < Scene::Base
    include Fixture::MainGame

    def initialize
      super
      @score = 0
      @player = Player.new(Window.width/2, Window.height - 50)

      #enemy_img = Image.new(64, 64, C_RED)
      enemy_img = Image.load("images/enemy1.png")
      ballet_img = Image.load("images/enemy_ballet.png")
      #5.times do |i|
        #Enemy.add(rand(770), 0,enemy_img)
      #end
      @enemy = Enemy.new(rand(400), 0, enemy_img)
      @beam = Beam.new(@enemy.getX,@enemy.getY,10,ballet_img)
    end

    def update
      super
      move_background_down_and_draw

      @player.update
      @player.draw
      @enemy.update
      @enemy.draw
      #@beam.update

      #management_enemy

      # どれか一つでも当たっていれば1得点(複数個当たっていても1点しか入らない)
      if Sprite.check(@player, Enemy.collection)
        @score += 1
      end
    end

    def next_scene
      Scene::Ending.new(@score)
    end

    def finish?
      # キーコード定数: https://download.eastback.co.jp/dxruby/api/constant_keycode.html
      quit_key = [K_ESCAPE]
      quit_key.each do |key|
        return true if Input.key_push?(key)
      end
      false
    end

    private
  end
end

