module Var 
  @@os_unix : Bool          = Path.new(@@path).windows?
  @@path    : String        = Dir.current
  @@curd    : Array(String) = Dir.entries(@@path).sort
  @@curdc = [] of Colorize::Object(String) | String
  
  def self.os_unix              ; @@os_unix end
  
  def self.path                 ; @@path end
  def self.path=(path : String) ; @@path = path end
  
  def self.curd                 ; @@curd end
  def self.reload_curd          ; @@curd = Dir.entries(@@path).sort end
  def self.curd=(path : String) ; @@curd = Dir.entries(path).sort end
  def self.curd=(ary  : Array(String)) ; @@curd = ary end
  
  def self.curdc                 ; @@curdc end
  def self.curdc=(ary  : Array(Colorize::Object(String) | String)) ; @@curdc = ary end
end

