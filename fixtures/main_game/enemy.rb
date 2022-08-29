module Fixture::MainGame
  class Enemy < Sprite
    attr_accessor :v
    # クラス変数は@@で作れる
    # クラス変数は親クラスで使用すると全ての子クラスに影響するので使用を控える
    # 変数の影響範囲を変数のscopeという
    @@collection = []

    def self.collection
      @@collection
    end

    def self.add(x, y, image)
      @@collection << self.new(x, y, image)
    end

    def initialize(x, y,image)
      # self.x, self.y: Spriteを親に持つEnemyはattr_accessorで定義されたx, yを持つ

      # self:      Enemyクラスから作られたインスタンスである自分
      # self.変数: selfの持つ変数を呼び出す (その処理はgetter/setterを呼び出す)
      # @変数:     インスタンス変数(privateで参照可能な変数)
      
      self.image = image
      self.x, self.y, = x, y
      @v = rand(7) - 3
    end

    def update
      # 加速度をランダムで決定(-3 ~ 3)
      #acceleration = rand(7) - 3
      # 速さのスカラーを最大10として、速度を計算
      #@v += acceleration
      #limitted_v = @v.abs % 10

      #@v = @v < 0 ? -limitted_v : limitted_v
      self.y += 2
      #self.y = (self.x + Window.width) % Window.width
      if self.y > 600
        hit(self)
      end
    end

    def hit(obj)
      self.class.collection.delete(self)
    end
  end
end