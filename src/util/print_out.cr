require "./format"
require "./var"
require "grid"
require "term-screen"


module PrintOut
  def self.tabular
    final = Var.table.map do |row| 
      row.map_with_index do |col, i| 
        col = col.matches?(/\D/) ? col.ljust(Var.just[i], ' ') : col.rjust(Var.just[i], ' ')
        col = i == 5 ? Format.load_color(col) : col if Format.is_color
        col
      end.join(" ")
    end.join("\n")
    
    print final
  end
  
  def self.liner
    final = Var.curd.map do |entry|
      Format.is_color ? Format.load_color(entry) : entry
    end.join(" ")
    
    print final
  end
  
  def self.grid
    grid = Grid.new(Var.curd)
    grid.virtual_generate(Term::Screen.width)
    grid.virtual_to_canvas
    final = grid.to_s
    
    print final
  end
end
