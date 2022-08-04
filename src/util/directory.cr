require "./var"

def append_slash
  Var.curd = Var.curd.map do |entry|
    entry += Var.os_unix ? "\\" : "/" if File.directory? Path.new(Var.path, entry)
    entry
  end
end
