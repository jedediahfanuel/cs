require "option_parser"
require "./util/*"

OptionParser.parse do |parser|
  parser.banner = "Usage: cs [argument]"

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
    NPath.update_path(path)
  end

  parser.on "-s", "--slash", "Append slash on directory" do
    Format.is_slash = true
  end

  parser.on "-t", "--tab", "Use tabular output" do
    Format.is_table = true
    Format.is_header = true
  end
end

if Format.is_slash
  Format.append_slash
end

if Format.is_table
  Format.header_just
  Format.tabular

  PrintOut.header if Format.is_header
  PrintOut.tabular
else
  PrintOut.grid
end
