//
//  Data.swift
//  FinalTest
//
//  Created by Adham Mohamed on 30/05/2025.
//

import Foundation
import Alamofire

struct LeaguesResponse: Codable {
    let result: [LeagueModel]
}

struct LeagueModel: Codable {
    let leagueName: String
    let leagueLogo: String?
    
    enum CodingKeys: String,CodingKey {
        case leagueName = "league_name"
        case leagueLogo = "league_logo"
        
    }
}

class NetworkManager {
    func getLeagues(sport: String, handler: @escaping (LeaguesResponse)->Void) {
            
            AF.request("https://apiv2.allsportsapi.com/\(sport)/?met=Leagues&APIkey=02c36a40019a925e2e5f1ae5a9627cc5e4a1022b7b15fda424ae9297f90b87f3")
                .responseDecodable(of: LeaguesResponse.self) { response in
                    switch response.result {
                    case .success(let items):
                        handler(items)
                        print(items.result.count)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
        }
}

