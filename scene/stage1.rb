module Scene
  # クラス名変更
  class Stage1 < Scene::Base
    # ステージ番号に変更
    include Fixture::Stage1
    def initialize
      super
      @player = Player1.new
      @enemy = Enemy1.new
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
        @player.damage
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
      #if @enemy === @player.bullets
        #@enemy.damage
        #@player.bullets_delete(i)
        #i += 1
      #end 
    end
  
    def next_scene
      # 勝利判定で敵の体力を使います
      Scene::Ending.new(@enemy.health)
    end
  
    def finish?
      return true if @player.health <= 0 || @enemy.health <= 0 || Input.key_push?(K_ESCAPE)
      false
    end
    private
  end
end