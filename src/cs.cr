require "option_parser"
require "./util/*"

OptionParser.parse do |parser|
  parser.banner = "Usage: cs [argument]"

  parser.invalid_option do |flag|
    Log.err(flag, "is not a valid option\n")
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

  parser.on "-s", "--slash", "Append slash on directory" do
    Format.is_slash = true
  end

  parser.on "-t", "--tab", "Use tabular output" do
    Format.is_table = true
    Format.is_header = true
  end
end

def proceed
  if Format.is_slash
    Format.append_slash
  end
  
  if Format.is_table
    Format.header_just
    Format.tabular
  
    PrintOut.header if Format.is_header
    PrintOut.tabular
    Var.flush_table
  else
    PrintOut.grid
  end
end

if NPath.filter_path.empty?
  PrintOut.path_header(Var.path)
  proceed
  exit(1)
end

NPath.filter_path.each do |path|
  if NPath.update_path(path)
    PrintOut.path_header(path)
    
    Var.reload_curd
    proceed
    
    print "\n"
  end
end

