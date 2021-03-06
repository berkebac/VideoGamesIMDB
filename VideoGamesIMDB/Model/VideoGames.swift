//
//  VideoGames.swift
//  VideoGamesIMDB
//
//  Created by Berke Baç on 28.04.2022.
//

import Foundation

struct GameList: Decodable {
    let results: [Game]
}

struct Game:Decodable {
    let id: Int
    let name: String
    let released: String
    let rating: Double
    let background_image: String?
}



/*
 {
   "count": 0,
   "next": "http://example.com",
   "previous": "http://example.com",
   "results": [
     {
       "id": 0,
       "slug": "string",
       "name": "string",
       "released": "2022-04-28",
       "tba": true,
       "background_image": "http://example.com",
       "rating": 0,
       "rating_top": 0,
       "ratings": {},
       "ratings_count": 0,
       "reviews_text_count": "string",
       "added": 0,
       "added_by_status": {},
       "metacritic": 0,
       "playtime": 0,
       "suggestions_count": 0,
       "updated": "2022-04-28T21:08:54Z",
       "esrb_rating": {
         "id": 0,
         "slug": "everyone",
         "name": "Everyone"
       },
       "platforms": [
         {
           "platform": {
             "id": 0,
             "slug": "string",
             "name": "string"
           },
           "released_at": "string",
           "requirements": {
             "minimum": "string",
             "recommended": "string"
           }
         }
       ]
     }
   ]
 }
 */
