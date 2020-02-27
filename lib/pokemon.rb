class Pokemon
  
  attr_accessor :name, :type, :db
  attr_reader :id 
  
  def self.initialize(id = nil, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
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
  end
    
    
  
end
