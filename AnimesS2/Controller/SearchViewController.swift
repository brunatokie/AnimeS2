//
//  SearchViewController.swift
//  AnimesS2
//
//  Created by Toki on 10/03/21.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .red
        return label
    }()
    
    var searchList : [SearchList] = []
    var newList : [SearchList] = []
    var searching = true
    var loadingAnime = false
    var currentPage = 1
    var total = 0
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
    func requestData(){
        SearchAnime.searchAnime(name: name, page: currentPage) { (result) in
            if let result = result {
                self.searchList += result.results
                self.total = result.last_page
                
                DispatchQueue.main.async {
                    self.loadingAnime = false
                    self.label.text = "Nao foram encontrados animes com este nome \(self.name!)"
                    self.tableView.reloadData()
                }
            }
        }
    }

  

}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return newList.count
        } else {
            return searchList.count
        }
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchTableViewCell
        
        if searching {
            cell.prepareSearch(with: newList[indexPath.row])
        } else {
            cell.prepareSearch(with: searchList[indexPath.row])
        }
        
       
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == searchList.count - 8 && !loadingAnime && searchList.count != total {
            currentPage += 1
            requestData()
        }
    }

}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.name = searchBar.text
        searching = false
        
        requestData()
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        tableView.reloadData()
    }
}
