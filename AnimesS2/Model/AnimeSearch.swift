//
//  Heart.swift
//  AnimesS2
//
//  Created by Toki on 10/03/21.
//

import UIKit
import Foundation


struct AnimeSearch: Codable {
    let results: [SearchList]
    let last_page : Int
}

struct SearchList: Codable {
    
    let malID: Int
        let url: String
        let imageURL: String
        let title: String
        let synopsis: String
        let episodes: Int
        let score: Double
        let members: Int
  

        enum CodingKeys: String, CodingKey {
            case malID = "mal_id"
            case url
            case imageURL = "image_url"
            case title, synopsis, episodes, score
            case members
}
}
