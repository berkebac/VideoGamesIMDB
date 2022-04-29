//
//  VideoGameService.swift
//  VideoGamesIMDB
//
//  Created by Berke Baç on 28.04.2022.
//

import Foundation
class WebService {
    
    func downloadData(url: URL, completion: @escaping ([VideoGames]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                
            }else if let data = data {
                do {
                    let videoGameList = try? JSONDecoder().decode((VideoGames.self), from: data)
                    print(videoGameList)
                    
                    
                }
                
                
                
                
            }
        }.resume()
        
    }
}
