//
//  AnimeDetail.swift
//  AnimesS2
//
//  Created by Toki on 04/03/21.
//

import Foundation
import UIKit

struct AnimeDetail: Codable {
    
    let malID: Int
    let url: String
    let imageURL: String
    let trailerURL: String
    let title, titleEnglish, titleJapanese: String
    let rating: String
    let score: Double
    let scoredBy, rank, popularity, members: Int
    let favorites: Int
    let synopsis: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
          
          case malID = "mal_id"
          case url
          case imageURL = "image_url"
          case trailerURL = "trailer_url"
          case title
          case titleEnglish = "title_english"
          case titleJapanese = "title_japanese"
         case type
          case rating, score
          case scoredBy = "scored_by"
          case rank, popularity, members, favorites, synopsis
         
      }
}





