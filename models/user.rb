class User < Sequel::Model
  plugin :timestamps    

  def self.woah
    return "WOAHs"
  end
end