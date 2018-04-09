require( 'pg' )

class SqlRunner

  def self.run( sql, values = [] )
    begin
      # db = PG.connect({ dbname: 'cycling_app', host: 'localhost' })
        db = PG.connect( {dbname: 'ddd1lpvalgmboj',
host: 'ec2-54-243-210-70.compute-1.amazonaws.com',
port: 5432, user: 'zkugusrihoaetl', password: 'f51dfcdb04f8b8675767100d4a07e0ff6ad40f48a7ce1548068f0cd4b8e84950'})
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end
