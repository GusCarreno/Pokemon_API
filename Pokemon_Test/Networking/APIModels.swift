//
//  APIModels.swift
//  Pokemon_Test
//
//  Created by Gustavo Carreno on 07/12/22.
//

import Foundation

struct APIResponse: Decodable {
    let next: String
    let results: [APIItem]
}

struct APIItem: Decodable {
    let name: String
    let url: String
}
