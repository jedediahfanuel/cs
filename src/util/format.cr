require "system/user"
require "colorize"
require "./var"

module Format
  @@is_color = false
  @@is_npath = false
  @@is_slash = false
  @@is_table = false
  
  {% for name in %w{is_color is_npath is_slash is_table} %}
    def self.{{name.id}}            ; @@{{name.id}}        end
    def self.{{name.id}}=(b : Bool) ; @@{{name.id}} = Bool end
  {% end %}
  
  def self.load_color(str : String)
    File.directory?(Path.new(Var.path, str)) ? str.colorize.fore(:blue).mode(:bold) : str
  end
  
  def self.append_slash
    Var.curd = Var.curd.map do |entry|
      entry += Var.os_unix ? "\\" : "/" if File.directory? Path.new(Var.path, entry)
      entry
    end
  end
  
  def self.tabular
    Var.curd.each do |entry|
      fi = File.info(Path.new(Var.path, entry))
      
      Var.table << [
        fi.permissions.to_s,
        System::User.find_by(id: fi.group_id).username.to_s,
        System::User.find_by(id: fi.owner_id).username.to_s,
        fi.size.to_s,
        fi.modification_time.to_local.to_s("%F %T").to_s,
        entry
      ]
      
      Var.just = adjust_column(Var.table.last)
    end
  end
  
  private def self.adjust_column(row : Array(String)) : Array(Int8)
    row.map_with_index { |col, i| check_length(col, Var.just[i]) }
  end
  
  private def self.check_length(str : String, temp_just : Int8) : Int8
    str.size > temp_just ? str.size.to_i8 : temp_just
  end
end
