//
//  MovieCard.swift
//  MovieList
//
//  Created by Seok Jun Noh on 10/27/21.
//

import UIKit

struct MovieCard: Decodable {
    let name: String
    let description: String
    let year: Int
    let poster: UIImage
    
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case year
        case poster
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        year = try container.decode(Int.self, forKey: .year)
        let imageName = try container.decode(String.self, forKey: .poster)
        poster = UIImage(named: imageName)!
    }
}
