module Scene
  class Opening < Scene::Base
    include Fixture::Select # for use Mouse class
    def initialize
      super
      @next_scene
      @string = "Space or Enter"
      question_image = Image.load("images/question.png")
      @mouse = Mouse.new
      @Question = Sprite.new(Window.width - question_image.width, question_image.height, question_image)
    end

    def update
      super
      @Question.draw
      if @mouse === @Question && Input.mouse_push?(M_LBUTTON)

      end
      move_background_right_and_draw
      Window.draw_font(
        Window.width/2 - @string.length/2 * Setting::TITLE_FONT_SIZE/2,
        Window.height/2 - Setting::TITLE_FONT_SIZE/2,
        @string, Font.new(Setting::TITLE_FONT_SIZE), {color: C_WHITE})
    end

    def next_scene
      Scene::Select.new
    end

    def finish?
      # キーコード定数: https://download.eastback.co.jp/dxruby/api/constant_keycode.html
      decide_key = [K_RETURN, K_SPACE]
      decide_key.each do |key|
        return true if Input.key_push?(key)
      end
      false
    end
  end
end