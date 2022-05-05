//
//  VideoGameService.swift
//  VideoGamesIMDB
//
//  Created by Berke Baç on 28.04.2022.
//

import Foundation
class WebService {
    
    func downloadData(url: URL, completion: @escaping ([GameList]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                
            }
            if let safeData = data {
                do {
                    let videoGameList = try JSONDecoder().decode((GameList.self), from: safeData)
                    print(videoGameList.results[0].name)
                }catch {
                    print(error)
                }
                
            }
        }.resume()
        
    }
}
