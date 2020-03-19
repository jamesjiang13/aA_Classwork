require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  #Cat.columns == [:id, :name, :owner_id]
  def self.columns
    return @cols if @cols
    table = DBConnection.execute2(<<-SQL)
    SELECT
        *
      FROM
        #{self.table_name}
    SQL
    @cols = table[0].map!(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |col|
      define_method(col) do
        attributes[col] 
      end

      define_method("#{col}=") do |val|   # where does val come from?!
        attributes[col] = val
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.name.tableize
  end

  def self.all
    @SQLobjects ||= []
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    
  end

  def initialize(params = {})
    # column_names = params.keys.map(&:to_sym)
    params.each do |key, value|
      raise "unknown attribute '#{key}'" if !self.class.columns.include?(key.to_sym)
      
      # SQLObject.finalize! 
      # define_method("#{key}=") do |value|   # where does val come from?!
      # attributes[key] = value

      # <object>.send(<method name>, *args)
      self.send("#{key}=", value)
    end
        
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
