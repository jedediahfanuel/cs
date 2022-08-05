require "system/user"
require "colorize"
require "./var"

module Format
  @@is_color = false
  @@is_table = false

  def self.is_color            ; @@is_color        end
  def self.is_color=(b : Bool) ; @@is_color = Bool end
  
  def self.is_table            ; @@is_table        end
  def self.is_table=(b : Bool) ; @@is_table = Bool end
  
  def self.load_color
    Var.curdc = Var.curd.map do |entry|
      entry = entry.colorize.fore(:blue).mode(:bold) if File.directory? Path.new(Var.path, entry)
      entry
    end
  end
  
  def self.append_slash
    Var.curd = Var.curd.map do |entry|
      entry += Var.os_unix ? "\\" : "/" if File.directory? Path.new(Var.path, entry)
      entry
    end
  end
  
  def self.tabular_output
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
    temp_just = 0_i8
    row.map { |col| check_length(col, temp_just) }
  end
  
  private def self.check_length(str : String, temp_just : Int8) : Int8
    str.size > temp_just ? str.size.to_i8 : temp_just
  end
end
