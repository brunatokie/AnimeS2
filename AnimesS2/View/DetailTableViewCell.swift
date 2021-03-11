//
//  DetailTableViewCell.swift
//  AnimesS2
//
//  Created by Toki on 04/03/21.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var lbAnime: UILabel!
    @IBOutlet weak var lbSinopse: UILabel!
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func prepareAnime(with detail: AnimeDetail){
        
        lbAnime.text = detail.title
        lbSinopse.text = detail.synopsis
        
    }
}
