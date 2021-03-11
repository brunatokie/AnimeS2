//
//  Rest.swift
//  AnimesS2
//
//  Created by Toki on 02/03/21.
//

import Foundation
import UIKit
import Alamofire


class JikanAPI{
    
    static private let basePath = "https://api.jikan.moe/v3/top/anime"
    static private let limit = 1
    
    
    class func loadAnimes(page: Int = 1, onComplete: @escaping (AnimeInfo?) -> Void){
    
        let url = basePath + "/\(page)"
        
        AF.request(url).responseJSON { (response) in
            
            guard let data = response.data else {
                onComplete(nil)
                return}
            
        do {
            let animeInfo = try? JSONDecoder().decode(AnimeInfo.self, from: data)
            onComplete(animeInfo)
           
        } catch {
            print(error.localizedDescription)
            onComplete(nil)
        }
    
    }
}
}

class DetailAPI {
    
    static private let basePath = "https://api.jikan.moe/v3/anime"
    
    class func loadDetail(id: Int, onComplete: @escaping (AnimeDetail?) -> Void){
    
        let url = basePath + "/\(id)"
        
        AF.request(url).responseJSON { (response) in
           
            guard let data = response.data else {
                onComplete(nil)
                print("erro aqui")
                return}
            
        do {
            let animeDetail = try? JSONDecoder().decode(AnimeDetail.self, from: data)
            
            onComplete(animeDetail)
           
           
        } catch {
            print("deu erro no parse")
            print(error.localizedDescription)
            onComplete(nil)
        }
    
    }
}
    
}

class SearchAnime {
    static private let basePath = "https://api.jikan.moe/v3/search/anime"
        
//        /search/anime?q=Fate/Zero&page=1
    
    class func searchAnime(name: String?, page: Int = 1, onComplete: @escaping (AnimeSearch?) -> Void){
        let startsWith: String
        
        if let name = name, !name.isEmpty {
            startsWith = "?q=\(name.replacingOccurrences(of: " ", with: ""))&"
        } else {
            startsWith = "?q=aaa&"
        }
        let url = basePath + startsWith + "page=\(page)"
        print("url!!!")
        print(url)
        
        AF.request(url).responseJSON { (response) in
            print(response)
            guard let data = response.data else {
                onComplete(nil)
                print("erro aqui")
                return}
            do {
                let animeSearch = try? JSONDecoder().decode(AnimeSearch.self, from: data)
                onComplete(animeSearch)
                print("animesearch!!!")
 print(animeSearch)
            } catch {
                print(error.localizedDescription)
                onComplete(nil)
            }
        }
    }
}

