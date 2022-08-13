require "./err"
require "./var"

module NPath
  def self.test_path(path : String)
    path = path.strip
    path = Path.home if ["~", "~/", "~\\"].any?(path)
    if Dir.exists?(path)
      path
    else
      Err.out(path, "is not a valid directory")
      exit(1)
    end
  end
  
  def self.update_path(path : String)
    test_path(path)
    Var.path = path unless path.empty?
    Var.reload_curd
  end
end

