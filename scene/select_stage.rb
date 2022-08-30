module Scene
    class Select < Scene::Base
    include Fixture::Select

      def initialize
        super()
        @next_scene = Scene::Select.new
        @stage1_button = Sprite.new(Window.width / 4, Window.height / 2, Image.new(100, 100, C_WHITE))
        @stage2_button = Sprite.new(Window.width / 2, Window.height / 2, Image.new(100, 100, C_WHITE))
        @stage3_button = Sprite.new(Window.width / 4 * 3, Window.height / 2, Image.new(100, 100, C_WHITE))
        @mouse = Mouse.new
        @checker = false
      end
  
      def update
        super
        move_background_right_and_draw
        Window.draw_font(Window.width - 100, Window.height / 4, "Please select stage!", Font.new(32))
        @stage1_button.draw
        @stage2_button.draw
        @stage3_button.draw
        @mouse.update
        if Input.mouse_push?(M_LBUTTON)
            @next_stage = Scene::Stage1.new if @mouse === @stage1_button
            @next_stage = Scene::Stage2.new if @mouse === @stage2_button
            @next_stage = Scene::Stage3.new if @mouse === @stage3_button
            @checker = true
        end
      end
  
      def next_scene
        @next_scene
      end
  
      def finish?
        # キーコード定数: https://download.eastback.co.jp/dxruby/api/constant_keycode.html
        quit_key = [K_RETURN, K_SPACE, K_ESCAPE, @checker]
        quit_key.each do |key|
          return true if Input.key_push?(key)
        end
        false
      end
    end
  end