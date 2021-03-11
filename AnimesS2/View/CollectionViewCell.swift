//
//  CollectionViewCell.swift
//  AnimesS2
//
//  Created by Toki on 03/03/21.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var animeLabel: UILabel!
    @IBOutlet weak var animeImage: UIImageView!
    
    
    
    func prepare(with anime: AnimeList){
        
        if let url = URL(string: anime.imageURL){
            
            animeImage.kf.indicatorType = .activity
            animeImage.kf.setImage(with: url)
            
            
        } else {
            animeImage.image = UIImage(named: "empty")
        }
        
        animeLabel.text = anime.title
        animeLabel?.layer.cornerRadius = 10

        animeLabel?.layer.masksToBounds = true
    }
}
