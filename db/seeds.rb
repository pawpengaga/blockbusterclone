require 'api'

movieArr = ["tt0118694", "tt2267998", "tt0094947", "tt0166924", "tt3837248", "tt0069089", "tt0056869", "tt18925334", "tt0062711", "tt0053318", "tt0068327", "tt0064940", "tt0112769", "tt0283832", "tt0179116", "tt0058213", "tt0033467", "tt9812474", "tt0213847", "tt0423651", "tt0082933", "tt0022183", "tt0054743", "tt0363547", "tt0088323", "tt0076162", "tt4263482", "tt7983894", "tt0324264", "tt4016934", "tt0808417", "tt0121766", "tt0056687", "tt0086879", "tt4263482", "tt0180073", "tt3316960", "tt2278388", "tt0103074", "tt0079920", "tt0032976", "tt2649356", "tt0036342", "tt1984119", "tt0077631", "tt0947798"]

movies_data = []

movieArr.each_with_index do |movie, index|
  api = Api.new("https://www.omdbapi.com/?i=#{movie}&apikey=#{ENV["movie_key"]}")
  movies_data << api.result()
end

movies_processed = []

movies_data.each do |moviehash|
  item = moviehash.slice("Title", "Poster")
  movies_processed << item
end
print movies_data

10.times do
  Customer.create(name: Faker::Name.name, age: Faker::Number.between(from: 18, to: 100))
end

movies_processed.each do |movie|
  Movie.create(name: movie["Title"], picture: movie["Poster"])
end
print movies_processed
