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
  
  parser.on "-c", "--color", "Use colorized output" do
    Format.color = true
  end
  
  parser.on "-p PATH", "--path PATH", "Specify the path" do |path| 
    test_path(path)
    Var.path = path unless path.empty?
    Var.reload_curd
  end
  
  parser.on "-s", "--slash", "Append slash on directory" do
    Format.append_slash
  end
end

if Format.color
  Format.load_color
  print Var.curdc.join(" ")
else
  print Var.curd.join(" ")
end

