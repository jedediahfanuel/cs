require "colorize"
require "./var"

module Format
  @@color = false

  def self.color            ; @@color        end
  def self.color=(b : Bool) ; @@color = bool end
  
  def self.load_color
    Var.curdc = Var.curd.map do |entry|
      entry = entry.colorize.fore(:blue).mode(:bold) if File.directory? Path.new(Var.path, entry)
      entry
    end
  end
  
  def self.append_slash
    Var.curd = Var.curd.map do |entry|
      entry += Var.os_unix ? "\\" : "/" if File.directory? Path.new(Var.path, entry)
      entry
    end
  end
end
