require "colorize"

module Err
  def self.out(var, custom_string = "is invalid")
    STDERR.print(
      "ERROR".colorize.fore(:red).mode(:bold),
      ": ",
      "#{var.colorize.fore(:yellow).mode(:bold)} #{custom_string}",
    )
  end
end
