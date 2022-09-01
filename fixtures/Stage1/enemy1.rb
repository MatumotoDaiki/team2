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
      
      @count = 0
      @beams = []

      #@beams << Beam1.new(self.x,self.y + 100,false, 0)


      @health = 20
      @v = rand(8) - 3
    end

    def update
      # 加速度をランダムで決定(-3 ~ 3)
      acceleration = rand(5) - 2
      # 速さのスカラーを最大10として、速度を計算
      @v += acceleration
      limitted_v = @v.abs % 7
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
      @beams.each { |n| n.update }
      @count += 1

      if @count % 30 == 0
        @beams << Beam1.new(self.x, self.y + 100, 3,0)
      end

      if @count % 300 == 0
        flag = 0
        x = -10
        y = 1
        20.times do
          @beams << Beam1.new(self.x+y, self.y+x + 100, y, x)
          x += 1
          if flag == 0
            y += 1
          else
            y -= 1
          end
          
          if y == 10
            flag = 1
          end
        end
      end
    end

    def damage
      @health -= 1
      puts "敵の体力残り:#{@health}"
    end

    def bullets_delete(i)
      @beams.delete_at(i)
    end
  end
end