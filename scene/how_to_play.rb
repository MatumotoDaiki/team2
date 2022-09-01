module Scene
  class How < Scene::Base

    def update
      super
      Window.draw_font(100, 100, "move:W, A, S, D", Font.new(32))
      Window.draw_font(Window.width, 100, "attack:SPACE key", Font.new(32))
    end

    def finish?
      return true if Input.mouse_push?(M_LBUTTON) || Input.key_push?(K_SPACE)
      false
    end
  end
end
