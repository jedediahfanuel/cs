require "./log"
require "./var"

module NPath
  def self.test_path(path : String)
    path = path.strip.sub('~', Path.home)

    if Dir.exists?(path)
      path
    else
      Log.warn(path, "is not a valid directory")
      exit(1)
    end
  end

  def self.update_path(path : String)
    path = test_path(path)
    Var.path = path unless path.empty?
    Var.reload_curd
  end
end
