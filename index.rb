require 'pg'

connect = PG::connect(host: "localhost", user: "postgres", password: "postgres", dbname: "postgres", port: "5432") 
results = connect.exec("SELECT city AS hoge FROM weather")

results.each{|result|
  p result["hoge"]
}

connect.finish