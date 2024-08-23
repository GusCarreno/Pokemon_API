//
//  ItemModels.swift
//  Pokemon_Test
//
//  Created by Gustavo Carreno on 08/23/24.
//

import Foundation

struct ItemDetails: Decodable {
    let name: String
    let sprites: ItemSprite
    let category: APIItem
    let effect: [Effect]
    
    private enum CodingKeys: String, CodingKey {
        case name, sprites, category
        case effect = "effect_entries"
    }
}

struct ItemSprite: Decodable {
    let `default`: String
}

struct Effect: Decodable {
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case description = "effect"
    }
}
