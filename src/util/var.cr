module Var 
  @@os_unix : Bool          = Path.new(@@path).windows?
  @@path    : String        = Dir.current
  
  @@curd    : Array(String) = Dir.entries(@@path).sort
  
  @@table  = [] of Array(String)
  @@just = Array(Int8).new(6, 0_i8)
  
  def self.os_unix              ; @@os_unix end
  
  def self.path                 ; @@path end
  def self.path=(path : String) ; @@path = path end
  
  def self.curd                 ; @@curd end
  def self.reload_curd          ; @@curd = Dir.entries(@@path).sort end
  def self.curd=(path : String) ; @@curd = Dir.entries(path).sort end
  def self.curd=(ary  : Array(String)) ; @@curd = ary end
  
  def self.table                    ; @@table end
  def self.just                     ; @@just  end
  def self.just=(ary : Array(Int8)) ; @@just = ary end
end

