module Fixture::Select
    class Mouse < Sprite
        def initialize
            self.x = Input.mouse_pos_x
            self.y = Input.mouse_pos_y
            self.image = Image.new(1, 1, C_WHITE)
        end
        
        def update
            self.x = Input.mouse_pos_x
            self.y = Input.mouse_pos_y
            self.draw
        end
    end
end