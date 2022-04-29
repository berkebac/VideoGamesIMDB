//
//  ViewController.swift
//  VideoGamesIMDB
//
//  Created by Berke Baç on 28.04.2022.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        let url = URL(string: "https://api.rawg.io/api/games?key=f39e8f6f841142ee823c395378985e0d&dates=2019-09-01,2019-09-30&platforms=18,1,7")!
        
        WebService().downloadData(url: url) { (games) in
            if let games = games {
                print(games)
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoGamesCell", for: indexPath) as! VideoGameTableViewCell
        return cell
        
    }

}

