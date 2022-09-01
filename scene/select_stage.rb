module Scene
  class Select < Scene::Base
    include Fixture::Select
    def initialize
      super
      @next_scene = Scene::Select
      button_size_x = 120
      button_image = Image.new(button_size_x, 100, C_WHITE)
      # 4等分する感じ
      @stage1_button = Sprite.new(Window.width / 4     - (button_size_x / 2), Window.height / 2, button_image)
      @stage2_button = Sprite.new(Window.width / 2     - (button_size_x / 2), Window.height / 2, button_image)
      @stage3_button = Sprite.new(Window.width / 4 * 3 - (button_size_x / 2), Window.height / 2, button_image)
      @mouse = Mouse.new
      @checker = false
    end

    def update
      super
      move_background_right_and_draw
      Window.draw_font(Window.width / 2 - 250, Window.height / 4, "Please select stage!", Font.new(64))
      @stage1_button.draw
      @stage2_button.draw
      @stage3_button.draw
      @mouse.update
      if Input.mouse_push?(M_LBUTTON)

        @next_stage = Scene::Stage1.new if @mouse === @stage1_button
        @next_stage = Scene::Stage2.new if @mouse === @stage2_button
        8        #@next_stage = Scene::Stage3.new if @mouse === @stage3_button
        @checker = true
      end
    end

    def next_scene
      @next_stage
    end

    def finish?
      # キーコード定数: https://download.eastback.co.jp/dxruby/api/constant_keycode.html
      quit_key = [K_RETURN, K_SPACE, K_ESCAPE]
      quit_key.each do |key|
        return true if Input.key_push?(key)
      end
      return true if @checker
      false
    end
  end
end