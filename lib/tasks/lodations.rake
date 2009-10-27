task :generate_recommendations => :environment do
  CannedQuery.all.each do |query|
    query.execute
  end
end

