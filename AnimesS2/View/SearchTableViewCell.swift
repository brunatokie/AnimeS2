//
//  SearchTableViewCell.swift
//  AnimesS2
//
//  Created by Toki on 10/03/21.
//

import UIKit
import Kingfisher

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var animeTitle: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    @IBOutlet weak var animeImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func prepareSearch(with anime: SearchList){
        animeTitle.text = anime.title
        lbScore.text = String(anime.score)
        
        if let url = URL(string: anime.imageURL){
            animeImage.kf.indicatorType = .activity
            animeImage.kf.setImage(with: url)
        } else {
            animeImage.image = UIImage(named: "empty")
        }
    }
}
