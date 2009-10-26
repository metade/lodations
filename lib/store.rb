class Store
end

# patch activerdf to run plain sparql queries
class Query2SPARQL
  def self.translate(query, engine=nil)
    return query if query.kind_of? String
    str = ""
    if query.select?
      distinct = query.distinct? ? "DISTINCT " : ""
      select_clauses = query.select_clauses.collect{|s| construct_clause(s)}
      
      str << "SELECT #{distinct}#{select_clauses.join(' ')} "
      str << "WHERE { #{where_clauses(query)} #{filter_clauses(query)}} "
      str << "LIMIT #{query.limits} " if query.limits
      str << "OFFSET #{query.offsets} " if query.offsets
    elsif query.ask?
      str << "ASK { #{where_clauses(query)} } "
    end
    
    return str
  end
end

class RDFLiteStore
  def initialize(endpoint)
    @endpoint = endpoint
    @adapter = ConnectionPool.add_data_source(:type => :redland)
    @adapter.enabled = true
  end
  
  def load(uri)
    @adapter.load(uri, 'rdfxml')
    
    p @adapter.dump
  end
end
