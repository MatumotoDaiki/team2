module Scene
  class Score < Scene::Base
    def initialize(stage_num, time, enemy_helth)
      @stage_num = stage_num
      @time = time / 60
      @win = true if enemy_helth < 0
    end

    def update
      Window.draw_font(100, Window.height / 3, "You Win!", Font.new(64))
      Window.draw_font(Window.width / 3,Window.height / 3 * 2, "Time : #{@time}", Font.new(32))
    end

    def finish?
      false
    end

    def next_scene

    end
  end
end