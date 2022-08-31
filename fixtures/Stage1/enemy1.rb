module Fixture::Stage1
  class Enemy1 < Sprite
    attr_accessor :v
    attr_accessor :health
    attr_accessor :beams
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

    def initialize
      # self.x, self.y: Spriteを親に持つEnemyはattr_accessorで定義されたx, yを持つ
      # self:      Enemyクラスから作られたインスタンスである自分
      # self.変数: selfの持つ変数を呼び出す (その処理はgetter/setterを呼び出す)
      # @変数:     インスタンス変数(privateで参照可能な変数)
      self.image = Image.load("images/enemy1.png")
      self.x, self.y, = 350, 100 
      
      #beam_count = 0

      @beams = Beam1.new(self.x,self.y + 100,false)


      @health = 20
      @v = rand(7) - 3
    end

    def update
      # 加速度をランダムで決定(-3 ~ 3)
      acceleration = rand(7) - 3
      # 速さのスカラーを最大10として、速度を計算
      @v += acceleration
      limitted_v = @v.abs % 10
      @v = @v < 0 ? -limitted_v : limitted_v
      #self.y += 2
      self.x = self.x + @v
      #beam_count += 1
      

      if self.y > 600
        hit(self)
      end

      if self.x < 0
        self.x = 750
      elsif self.x > 800
        self.x = 0
      end
      @beams.update
    end

    def damage
      @health -= 1
    end

    def getX
      return self.x
    end

    def getY
      return self.y
    end
  end
end