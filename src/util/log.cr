require "colorize"

module Log
  def self.info(var, custom_string = "is invalid")
    STDOUT.print(
      "INFO".colorize.fore(:green).mode(:bold),
      ": ",
      "#{var.colorize.fore(:cyan).mode(:bold)} #{custom_string}\n",
    )
  end
  
  def self.warn(var, custom_string = "is invalid")
    STDOUT.print(
      "WARN".colorize.fore(:yellow).mode(:bold),
      ": ",
      "#{var.colorize.fore(:blue).mode(:bold)} #{custom_string}\n",
    )
  end
  
  def self.err(var, custom_string = "is invalid")
    STDERR.print(
      "ERROR".colorize.fore(:red).mode(:bold),
      ": ",
      "#{var.colorize.fore(:yellow).mode(:bold)} #{custom_string}\n",
    )
  end
end
