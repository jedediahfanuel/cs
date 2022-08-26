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
    }.join("\n") + ("\n")
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
    grid.auto(Term::Screen.width)
    print grid.to_s_enhancement
  end
  
  def self.path_header(_path : String)
    print "#{Format.path_header(_path)}: \n"
  end
end

# Extending from grid library :: adding color to directory
struct Grid
  def to_s_enhancement(top_down : Bool = true, align_left : Bool = true, sep : String = @separator) : String
    sep = sep[0..(@separator.size-1)] if @separator.size < sep.size
    String.build do |io|
      if top_down
        return "" if @canvas_td.empty?
        @canvas_td.first.size.times do |row|
          @col_width_td.each_with_index do |w, col|
            next unless @canvas_td[col][row]?
            io << Format.load_color(align_left ? @canvas_td[col][row].ljust(w, ' ') : @canvas_td[col][row].rjust(w, ' ')) if Format.is_color
            io << (align_left ? @canvas_td[col][row].ljust(w, ' ') : @canvas_td[col][row].rjust(w, ' ')) unless Format.is_color
            io << sep if col < (@col_width_td.size - 1)
          end
          io << "\n"
        end
      else
        return "" if @canvas_lr.empty?
        @canvas_lr.each do |row|
          row.each_with_index do |str, i|
            io << (align_left ? str.ljust(@col_width_lr[i], ' ') : str.rjust(@col_width_lr[i], ' '))
            io << sep if i < (row.size - 1)
          end
          io << "\n"
        end
      end
    end
  end
end
