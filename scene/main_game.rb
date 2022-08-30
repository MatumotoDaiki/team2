module Scene
  class MainGame < Scene::Base
    include Fixture::MainGame

    def initialize
      super

      @player = Player.new(Window.width/2, Window.height - 50)
      @enemy = Enemy.new

    end

    def update
      super
      move_background_down_and_draw

      @player.update
      @player.draw

      @enemy.update
      @enemy.draw
      

      # 衝突判定
      if @player === @enemy
        @player.damege
      end

      if @player === @enemy.beams
        @player.damege
      end

      if @enemy === @player.bullets
        @player.damege
      end

    end

    def next_scene
      # 勝利判定で敵の体力を使います
      Scene::Ending.new(@enemy.helth)
    end

    def finish?
      return true if @player.helth <= 0 || @enemy.helth <= 0 || Input.key_push?(K_ESCAPE)
      false
    end
    private
  end
end