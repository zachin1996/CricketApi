//
//  Modeling.swift
//  weather
//
//  Created by Sachin on 12/06/19.
//  Copyright © 2019 Sachin. All rights reserved.
//

import Foundation

struct Games: Codable{
    let team_1:String?
    let team_2:String?
    let date:String?
    
    enum CodingKeys: String,CodingKey{
        
        case team_1 = "team-1"
         case team_2 = "team-2"
        case date
    }
}

struct Play: Codable {
    let v: String
    let creditsLeft: Int
    let ttl: Int
    let matches: [Games]
}

struct Prev:Codable{
    let v: String
    let ttl :Int
    let cache: Bool
    let data: [Old]
}
struct Old:Codable{
    let description:String?
    let unique_id:String?
    let title:String?
}
