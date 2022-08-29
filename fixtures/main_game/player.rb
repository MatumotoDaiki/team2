module Fixture::MainGame
  class Player < Sprite
    def initialize(x, y)
      # self.x, self.y: Spriteを親に持つPlayerはattr_accessorで定義されたx, yを持つ

      # self:      Playerクラスから作られたインスタンスである自分
      # self.変数: selfの持つ変数を呼び出す (その処理はgetter/setterを呼び出す)
      # @変数:     インスタンス変数 (privateで参照可能な変数)

      self.x = x
      self.y = y
      self.image = Image.load("images/player.png")
      self.image.set_color_key(C_WHITE)
    end

    def update
      self.x += Input.x * 3# 「←」キー: -1, 「→」キー: 1, 押下無し: 0
      self.x = (self.x + Window.width) % Window.width
      self.y += Input.y * 3 # 「↑」キー: -1, 「↓」キー: 1, 押下無し: 0
      self.y = (self.y + Window.height) % Window.height
    end
  end
end