//
//  VideoGameViewModel.swift
//  VideoGamesIMDB
//
//  Created by Berke Baç on 29.04.2022.
//

import Foundation

struct VideoGameListViewModel {
    var videoGameList : [GameList]
    
    func numberOfRowsInSection() -> Int {
        print(videoGameList.count)
        return self.videoGameList.count
     }
    func gameAtIndex(_ index:Int) -> VideGameViewModel {
        let gameItem : [Game]
        gameItem = self.videoGameList[index].results
        return VideGameViewModel(gameItem[0])
        
    }
}

struct VideGameViewModel {
    let game: Game
    
    init(_ gameInit: Game){
        self.game = gameInit
    }
    
    
    var rating:Double{
        return game.rating
    }
    var released:String{
        return game.released
    }
    var name: String{
        return game.name
    }
    
    var image: URL?{
        if let urlString = game.background_image{
            let url = URL(string: urlString)
            return url
        }else{
            return nil
        }
    }
    
    
}
