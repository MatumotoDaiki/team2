module Scene
  class How < Scene::Base

    def update
      super
      just_draw
      Window.draw(0, 100, Image.load("images/question_scene.png"))
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
