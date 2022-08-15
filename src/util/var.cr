module Var 
  @@os_unix : Bool          = Path.new(@@path).windows?
  @@path    : String        = Dir.current
  
  @@curd    : Array(String) = Dir.entries(@@path).sort_by! { |str| str.downcase }
  
  @@table  = [] of Array(String)
  @@just = Array(Int8).new(6, 0_i8)
  
  @@header = ["Permissions", "Group", "User", "Size", "Modified", "Name"]
  
  def self.os_unix               ; @@os_unix end
  
  def self.path                  ; @@path end
  def self.path=(_path : String) ; @@path = _path end
  
  def self.curd                  ; @@curd end
  def self.reload_curd           ; @@curd = Dir.entries(@@path).sort_by! { |str| str.downcase } end
  def self.curd=(_path : String) ; @@curd = Dir.entries(_path).sort_by! { |str| str.downcase } end
  def self.curd=(ary  : Array(String)) ; @@curd = ary end
  
  def self.table                    ; @@table end
  def self.just                     ; @@just  end
  def self.just=(ary : Array(Int8)) ; @@just = ary end
  
  def self.header                   ; @@header end
end

