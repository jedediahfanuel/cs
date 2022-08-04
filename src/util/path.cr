require "./err"

def self.test_path(path : String)
  path = path.strip
  if File.directory?(path)
    path
  else
    Err.out(path, "is not a valid directory")
    exit(1)
  end
end
