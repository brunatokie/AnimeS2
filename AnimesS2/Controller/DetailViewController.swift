//
//  DetailViewController.swift
//  AnimesS2
//
//  Created by Toki on 03/03/21.
//

import UIKit
import Foundation
import Kingfisher

class DetailViewController: UIViewController {

  
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var animeImage: UIImageView!
    @IBOutlet weak var lbRank: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    @IBOutlet weak var lbType: UILabel!
    @IBOutlet weak var heartLabel: UIButton!
    
    
    var animeDetail: AnimeDetail?
    var selectedAnimeID : AnimeList!
    
    private var isLiked = false
    private let unlikedImage = UIImage(named: "heart_empty")
    private let likedImage = UIImage(named: "heart")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        loadDetail()
    }
    
    
    
    
    func loadDetail(){
        let id = selectedAnimeID.malID

            DetailAPI.loadDetail(id: id) { (response) in
                if let response = response {
                  
                    self.animeDetail = response
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
    }
    

   
    @IBAction func heartPressed(_ sender: UIButton) {

       isLiked = !isLiked
        if isLiked {
            heartLabel.setImage(likedImage, for: .normal)
        } else {
            heartLabel.setImage(unlikedImage, for: .normal)
        }
    }
    
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetailTableViewCell
        
        if let animeDetail = animeDetail {
        
            lbRank.text = String(animeDetail.rank)
            lbScore.text = String(animeDetail.score)
            lbType.text = animeDetail.type
            
            cell.prepareAnime( with: animeDetail)
            if let url = URL(string: animeDetail.imageURL){
                animeImage.kf.indicatorType = .activity
                animeImage.kf.setImage(with: url)
            } else{
                animeImage.image = nil
            }
            
            
        }
        
        
        return cell
    }
    


    }


