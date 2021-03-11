//
//  ViewController.swift
//  AnimesS2
//
//  Created by Toki on 02/03/21.
//

import UIKit
import Foundation

class ViewController: UIViewController  {
    
  
    var animeTop: [AnimeList] = []
   
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = (view.frame.size.width - 10) / 2
        let hight = (view.frame.size.height) / 3
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: hight)
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        requestLoad()
        
    }
    
    
    func requestLoad(){
        JikanAPI.loadAnimes() { (info) in
            if let info = info {
                self.animeTop = info.top
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "identifier" {
            if let vc = segue.destination as? DetailViewController{
                if let anime = sender as? AnimeList{
                vc.selectedAnimeID = anime
                }}
        }
    }
    
}




extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animeTop.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.prepare(with: animeTop[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        var animeId = animeTop[indexPath.row]
        
        performSegue(withIdentifier: "identifier", sender: animeId)
        
    }
    

}

