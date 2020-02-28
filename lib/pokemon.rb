require 'pry'
class Pokemon
  
<<<<<<< HEAD
  attr_accessor :id, :name, :type, :db
  
  
  def initialize(id:, name:, type:, db:)
=======
  attr_accessor :name, :type, :db
  attr_reader :id 
  
  def self.initialize(id = nil, name, type, db)
>>>>>>> c53ddbca726a6e7ae26501eae66a412e468febc3
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
<<<<<<< HEAD
  def self.save(name, type, db)
  db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  
  end
  
  def self.find(id, db)
    sql = <<-SQL 
    SELECT * FROM pokemon 
    WHERE  id = ?
    LIMIT 1
    SQL
  
    pokemon = db.execute(sql, [id]).flatten
    Pokemon.new(id:pokemon[0], name:pokemon[1], type:pokemon[2], db:db)    
=======
  def self.save
    sql = <<-SQL
      INSERT INTO pokemon (name, type) 
      VALUES (?, ?)
    SQL

    DB[:conn].execute(sql, self.name, self.type)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  
  end
  
  def self.find(id)
    sql = <<-SQL 
    SELECT * FROM pokemon 
    WHERE = ?
    LIMIT 1
    
    SQL
    
    DB[:conn].execute(sql, name).map do |row|
      self.new_from_db(row)
    end.first
>>>>>>> c53ddbca726a6e7ae26501eae66a412e468febc3
  end
    
    
  
end
