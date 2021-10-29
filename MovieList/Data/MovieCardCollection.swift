import UIKit

struct MovieCardCollection {
    
    static let movieCollection: [MovieCard] = {
        return parseMovies(from: url)
    }()
    
    private static func parseMovies(from url: String) -> [MovieCard] {
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            
            guard let data = data, error == nil else {
                print("something went wrong...")
                return
            }
            
            // We have data
            var result: Response?
            do {
                result = try JSONDecoder().decode(Response.self, from: data)
            }
            catch {
                print("failed to convert \(error.localizedDescription)")
            }
            
            guard let json = result else {
                return
            }
            
            print(json.status)
            
        })
        
        task.resume()
        
        return []
    }
}

let url = "http://files.tmdb.org"

// Codable lets us convert data that we get back from a network call from a URL to an actual class or a struct with one line of code.
struct Response: Codable {
    let results: MyResult?
    let status: String?
}

struct MyResult: Codable {
    let adult: Bool?
    let backdrop_path: String?
    let belongs_to_collection: Belongs_To_Collection?
    let budget: Int?
    let genre: Genre?
    let homepage: String?
    let id: Int?
    let imdb_id: String?
    let original_language: String?
    let original_title: String?
    let overview: String?
    let popularity: Float?
    let poster_path: String?
    let production_companies: Production_Companies?
    let production_countries: Production_Countries?
    let release_date: String?
    let revenue: Int?
    let runtime: Int?
    let spoken_language: Spoken_Language?
    let status: String?
    let tagline: String?
    let title: String?
    let video: Bool?
    let vote_average: Float?
    let vote_count: Int?
}

struct Belongs_To_Collection: Codable {
    let id: Int?
    let name: String?
    let poster_path: String?
    let backdrop_path: String?
}

struct Genre: Codable {
    let id: Int?
    let name: String?
}

struct Production_Companies: Codable {
    let id: Int?
    let logo_path: String?
    let name: String?
    let origin_country: String?
}

struct Production_Countries: Codable {
    let iso_3166_1: String?
    let name: String?
}

struct Spoken_Language: Codable {
    let english_name: String?
    let iso_639_1: String?
    let name: String?
}

/*
 API Key : 30cff00cc74b7a77615b101e75bf03c5
 
 {
     "adult":false,
     "backdrop_path":"/nlCHUWjY9XWbuEUQauCBgnY8ymF.jpg",
     "belongs_to_collection":{
                                 "id":8945,
                                 "name":"Mad Max Collection",
                                 "poster_path":"/uuvSvLb3ntGA9B0wx2JskVDSuWi.jpg",
                                 "backdrop_path":"/gwYe803SFwKlCF5y71OicWHUnVD.jpg"},
     "budget":150000000,
     "genres":  [{
                 "id":28,
                 "name":"Action"},
                {
                 "id":12,
                 "name":"Adventure"},
                {
                 "id":878,
                 "name":"Science Fiction"}],
     "homepage":"https://www.warnerbros.com/movies/mad-max-fury-road",
     "id":76341,
     "imdb_id":"tt1392190",
     "original_language":"en",
     "original_title":"Mad Max: Fury Road",
     "overview":"An apocalyptic story set in the furthest reaches of our planet, in a stark desert landscape where humanity is broken, and most everyone is crazed fighting for the necessities of life. Within this world exist two rebels on the run who just might be able to restore order.",
     "popularity":77.939,
     "poster_path":"/8tZYtuWezp8JbcsvHYO0O46tFbo.jpg",
     "production_companies":[{
                                 "id":2537,
                                 "logo_path":null,
                                 "name":"Kennedy Miller Productions",
                                 "origin_country":"AU"},
                             {
                                 "id":174,
                                 "logo_path":"/IuAlhI9eVC9Z8UQWOIDdWRKSEJ.png",
                                 "name":"Warner Bros. Pictures",
                                 "origin_country":"US"},
                             {
                                 "id":41624,
                                 "logo_path":"/wzKxIeQKlMP0y5CaAw25MD6EQmf.png",
                                 "name":"RatPac Entertainment",
                                 "origin_country":"US"},
                             {
                                 "id":79,
                                 "logo_path":"/tpFpsqbleCzEE2p5EgvUq6ozfCA.png",
                                 "name":"Village Roadshow Pictures",
                                 "origin_country":"US"}],
     "production_countries":[{
                                 "iso_3166_1":"AU",
                                 "name":"Australia"},
                             {
                                 "iso_3166_1":"US",
                                 "name":"United States of America"},
                             {
                                 "iso_3166_1":"ZA",
                                 "name":"South Africa"}],
     "release_date":"2015-05-13",
     "revenue":378858340,
     "runtime":121,
     "spoken_languages":[{
                             "english_name":"English",
                             "iso_639_1":"en",
                             "name":"English"}],
     "status":"Released",
     "tagline":"What a Lovely Day.",
     "title":"Mad Max: Fury Road",
     "video":false,
     "vote_average":7.5,
     "vote_count":18535
 }

 */
