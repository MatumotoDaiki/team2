module Scene
  class Score < Scene::Base
    include Fixture::Select
    def initialize(stage_num, time, enemy_helth)
      @stage_num = stage_num
      @time = time / 60
      @win = true if enemy_helth < 0
      @background = Image.load("images/result_background.jpg")

      button_size_x = 120
      button_image = Image.new(button_size_x, 100, C_WHITE)
      @retry_button = Sprite.new(Window.width / 4     - (button_size_x / 2), Window.height / 2, button_image)
      @choose_stage = Sprite.new(Window.width / 2     - (button_size_x / 2), Window.height / 2, button_image)
      button_image = Image.new(button_size_x, 100, C_GREEN)
      @finish_button = Sprite.new(Window.width / 4 * 3 - (button_size_x / 2), Window.height / 2, button_image)
      @mouse = Mouse.new
      @checker = false
      @next_stage = Scene::Score.new(stage_num, time, enemy_helth)
    end

    def update
      Window.draw(0, 0, @background)
      Window.draw_font(100, Window.height / 3, "You Win!", Font.new(64))
      Window.draw_font(Window.width / 3,Window.height / 3 * 2, "Time : #{@time}", Font.new(32))
      @retry_button.draw
      Window.draw_font(Window.width / 4 - (120 / 2) + 10, Window.height / 2 + 30, "RETRY", Font.new(32), color: C_BLACK)
      @choose_stage.draw
      Window.draw_font(Window.width / 2 - (120 / 2) + 5, Window.height / 2 + 30, "SELECT", Font.new(32), color: C_BLACK)
      @finish_button.draw
      Window.draw_font(Window.width / 4 * 3 - (120 / 2) + 10, Window.height / 2 + 30, "FINISH", Font.new(32), color: C_BLACK)

      if Input.mouse_push?(M_LBUTTON)
        puts "クリックされた"
        @next_stage = Scene::Stage1.new if @mouse === @retry_button
        @next_stage = Scene::Select.new if @mouse === @choose_stage
        @next_stage = nil if @mouse === @finish_button
        @checker = true
      end
    end


    def next_scene
      puts "si-nn"
      @next_stage
    end
    
    def finish?
      @checker
    end
  
  end
end