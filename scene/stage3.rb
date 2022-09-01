module Scene
  class Stage3 < Scene::Base
    include Fixture::Stage3

    def initialize
      super
      @time = 0
      @player = Player3.new
      @enemy = Enemy3.new
    end

    def update
      super
      move_background_down_and_draw
      @time += 1
      @player.update
      @enemy.update

      collision
    end

    def collision
      @player.beams.length.times do |n|
        if @player.beams[n] === @enemy
          @enemy.hit
          @player.del(n)
        end
      end

      @enemy.beams.length.times do |n|
        if @enemy.beams[n] === @player
          @player.hit
          @enemy.del(n)
        end
      end

    end

    def finish?
      return true if @player.health <= 0 || @enemy.health <= 0 || Input.key_push?(K_ESCAPE)
      false
    end

    def next_scene
      Scene::Ending.new(@time / 60)
    end
  end
end
