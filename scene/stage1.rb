module Scene
  # クラス名変更
  class Stage1 < Scene::Base
    # ステージ番号に変更
    include Fixture::Stage1
    def initialize
      super
      @player = Player1.new
      @enemy = Enemy1.new
      @time = 0
    end
  
    def update
      super
      move_background_down_and_draw
      @time += 1
      @player.update
      @player.draw
      
      @enemy.update
      @enemy.draw
      
      # 衝突判定
      if @player === @enemy
        @player.damage
      end

      f = 0
      for beam in @enemy.beams
        if @player === beam
          @player.damage
          @enemy.bullets_delete(f)
        end
        f += 1
      end

      if @player === @enemy.beams
        @player.damage
      end

      i = 0
      for bullet in @player.bullets
        if @enemy === bullet
          @enemy.damage
          @player.bullets_delete(i)
        end
        i += 1
      end
    end
  
    def next_scene
      # 勝利判定で敵の体力を使います
      Scene::Ending.new(@enemy.health)
    end
  
    def finish?
      return true if @player.health <= 0 || @enemy.health <= 0 || Input.key_push?(K_ESCAPE)
      false
    end

    def next_scene
      Scene::Score.new(1, @time, @enemy.health)
    end
  end
end