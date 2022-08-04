require "option_parser"
require "./util/*"

OptionParser.parse do |parser|
  parser.banner = "Usage: cs -- [argument]"
  
  parser.invalid_option do |flag|
    Err.out(flag, "is not a valid option\n")
    STDERR.puts parser
    exit(1)
  end
  
  parser.on "-h", "--help", "Display help page" do
    puts parser
    exit
  end
  
  parser.on "-c", "--color", "Use coloring output" do
    config
    print Var.curdc.join(" ") ; exit
  end
  
  parser.on "-p PATH", "--path PATH", "Specify the path" do |path| 
    test_path(path)
    Var.path = path unless path.empty?
    Var.reload_curd
  end
  
  parser.on "-s", "--slash", "Append slash on directory" do
    append_slash
  end
end

# Default command [ without arguments ]
print Var.curd.join(" ")

