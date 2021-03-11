//
//  Animes.swift
//  AnimesS2
//
//  Created by Toki on 02/03/21.
//

import Foundation
import UIKit


struct AnimeInfo: Codable{
    let top: [AnimeList]
}

struct AnimeList: Codable {
    
    let malID, rank: Int
    let title: String
    let url: String
    let imageURL: String
    let type: TypeEnum
    let episodes: Int
    let startDate: String
    let endDate: String?
    let members: Int
    let score: Double
    
    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case rank, title, url
        case imageURL = "image_url"
        case type, episodes
        case startDate = "start_date"
        case endDate = "end_date"
        case members, score
    }
}

enum TypeEnum: String, Codable {
    case movie = "Movie"
    case ova = "OVA"
    case tv = "TV"
}


struct Money {
var moneyInDolar: Double
init(fromEuro euro: Double) {
    moneyInDolar = euro * 0.8
}
init(fromReal real: Double) {
    moneyInDolar = real * 3.18
}
init(_ dolar: Double) {
moneyInDolar = dolar
}
}
