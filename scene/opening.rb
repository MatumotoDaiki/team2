module Scene
  class Opening < Scene::Base
    include Fixture::Select # for use Mouse class
    def initialize
      super
      @next_scene = Scene::Select.new
      @string = "Space or Enter"
      question_image = Image.load("images/question.png")
      @mouse = Mouse.new
      @question_click = false
      @Question = Sprite.new(Window.width - question_image.width, question_image.height, question_image)
    end

    def update
      super
      move_background_right_and_draw

      @Question.draw
      @mouse.update
      if @mouse === @Question && Input.mouse_push?(M_LBUTTON)
        @next_scene = Scene::How.new
        @question_click = true
      end
      Window.draw_font(
        Window.width/2 - @string.length/2 * Setting::TITLE_FONT_SIZE/2,
        Window.height/2 - Setting::TITLE_FONT_SIZE/2,
        @string, Font.new(Setting::TITLE_FONT_SIZE), {color: C_WHITE})
    end

    def next_scene
      @next_scene
    end

    def finish?
      # キーコード定数: https://download.eastback.co.jp/dxruby/api/constant_keycode.html
      decide_key = [K_RETURN, K_SPACE]
      decide_key.each do |key|
        return true if Input.key_push?(key)
      end
      return true if @question_click
      false
    end
  end
end