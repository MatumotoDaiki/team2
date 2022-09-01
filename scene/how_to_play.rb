module Scene
  class How < Scene::Base

    def update
      super
      move_background_right_and_draw

      Window.draw_font(Window.width / 2 - 200, 100, "move : W, A, S, D", Font.new(32))
      Window.draw_font(Window.width / 2 - 200, Window.height / 2, "attack : SPACE key", Font.new(32))
      Window.draw_font(Window.width / 2 - 180, Window.height - 100, "Please click or push space key", Font.new(25))
    end

    def next_scene
      Scene::Opening.new
    end
    def finish?
      return true if Input.mouse_push?(M_LBUTTON) || Input.key_push?(K_SPACE)
      false
    end
  end
end
