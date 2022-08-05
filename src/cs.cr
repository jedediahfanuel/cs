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
    Format.is_color = true
  end
  
  parser.on "-p PATH", "--path PATH", "Specify the path" do |path| 
    test_path(path)
    Var.path = path unless path.empty?
    Var.reload_curd
  end
  
  parser.on "-s", "--slash", "Append slash on directory" do
    Format.append_slash
  end
  
  parser.on "-t", "--tab", "Use tabular output" do
    Format.is_table = true
  end
end

if Format.is_table
  Format.tabular_output
  # print Var.table.map(&.map(&.ljust(20, ' ')).join(" ")).join("\n")
  print Var.table.map { |a| 
    a.map_with_index { |col, i| 
      col.matches?(/\D/) ? col.ljust(Var.just[i], ' ') : col.rjust(Var.just[i], ' ')
    }.join(" ")
  }.join("\n")
elsif Format.is_color
  Format.load_color
  print Var.curdc.join(" ")
else
  print Var.curd.join(" ")
end

