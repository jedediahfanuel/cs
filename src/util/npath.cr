require "./log"
require "./var"

module NPath
  @@accept = [] of String
    
  def self.filter_path : Array(String)
    @@accept = ARGV.reject(&.starts_with?('-')).map do |path|
      path
    end
  end
  
  def self.test_path(path : String)
    path = path.strip.sub('~', Path.home)

    if Dir.exists?(path)
      path
    else
      Log.warn(path, "is not a valid directory")
      ""
    end
  end

  def self.update_path(path : String)
    path = test_path(path)
    unless path.empty?
      Var.path = path
      true
    else
      false
    end
  end
end
