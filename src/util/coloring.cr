require "colorize"
require "./var"

def self.config
  Var.curdc = Var.curd.map do |entry|
    entry = entry.colorize.fore(:blue).mode(:bold) if File.directory? Path.new(Var.path, entry)
    entry
  end
end
