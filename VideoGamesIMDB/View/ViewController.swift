//
//  ViewController.swift
//  VideoGamesIMDB
//
//  Created by Berke Baç on 28.04.2022.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UITableView!
    
    private var videoGameListViewModel : VideoGameListViewModel!
    
    var myGameList = [Game]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        takeData()
        
        
    }
    /*
     func getData() {
        let url = URL(string: "https://api.rawg.io/api/games?key=f39e8f6f841142ee823c395378985e0d")!
        
        WebService().downloadData(url: url) { gamesData in
            
            if let gamesData = gamesData {
                self.videoGameListViewModel = VideoGameListViewModel(videoGameList: gamesData)
                DispatchQueue.main.sync {
                    self.tableView.reloadData()
                }
            }else {
                
            }
        }
    }
     */
    func takeData() {
        
        let url = URL(string: "https://api.rawg.io/api/games?key=f39e8f6f841142ee823c395378985e0d")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
                if error != nil || data == nil {
                    print("Hata")
                }
                do {
                    let gameListParse = try JSONDecoder().decode(GameList.self, from: data!)
                    self.myGameList = gameListParse.results
                    
                    DispatchQueue.main.sync {
                        self.tableView.reloadData()
                    }
                    
                }catch {
                    print(error.localizedDescription)
                }
            }.resume()
    }
    
    func searchData(searchText : String) {
        var request = URLRequest(url: URL(string: "https://api.rawg.io/api/games?key=f39e8f6f841142ee823c395378985e0d")!)
        request.httpMethod = "POST"
        let postString = "game=\(searchText)"
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
                if error != nil || data == nil {
                    print("Hata")
                }
                do {
                    let gameListParse = try JSONDecoder().decode(GameList.self, from: data!)
                    self.myGameList = gameListParse.results
                    
                    DispatchQueue.main.sync {
                        self.tableView.reloadData()
                    }
                    
                }catch {
                    print(error.localizedDescription)
                }
            }.resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let videoGame = myGameList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoGamesCell", for: indexPath) as! VideoGameTableViewCell
        
        cell.gameNameText.text = videoGame.name
        cell.ratingText.text = String(videoGame.rating)
        return cell
    }

}

