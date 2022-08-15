require "./format"
require "./var"
require "grid"
require "term-screen"

module PrintOut
  def self.tabular
    print Var.table.map { |row|
      row.map_with_index do |col, i|
        col = col.matches?(/\D/) ? col.ljust(Var.just[i], ' ') : col.rjust(Var.just[i], ' ') if i < 5
        col = i == 5 ? Format.load_color(col) : col if Format.is_color
        col
      end.join(" ")
    }.join("\n")
  end

  def self.header
    print Format.header(Var.header.map_with_index { |col, i|
      col == "Size" ? col.rjust(Var.just[i], ' ') : col.ljust(Var.just[i], ' ')
    }).join(" ") + "\n"
  end

  def self.liner
    print Var.curd.map { |entry|
      Format.is_color ? Format.load_color(entry) : entry
    }.join(" ")
  end

  def self.grid
    grid = Grid.new(Var.curd)
    grid.virtual_generate(Term::Screen.width)
    grid.virtual_to_canvas
    final = grid.to_s

    print final
  end
end
