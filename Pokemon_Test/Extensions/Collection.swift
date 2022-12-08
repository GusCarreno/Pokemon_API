//
//  Collection.swift
//  Pokemon_Test
//
//  Created by Gustavo Carreno on 07/12/22.
//

import Foundation

extension Collection where Element == ItemDetails {
    func filtered(from string: String) -> [Element] {
        filter {
            $0.name.foundMatch(for: string) ||
            $0.effect.description.foundMatch(for: string) ||
            $0.category.name.foundMatch(for: string)
        }.sorted(by: { $0.name < $1.name })
    }
}
