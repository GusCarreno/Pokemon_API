//
//  CollectionCellConfigurations.swift
//  Pokemon_Test
//
//  Created by Gustavo Carreno on 08/23/24.
//

import Foundation

typealias CollectionCell = CollectionCellConfiguration<PokedexCell, PokemonDetails>

extension CollectionCellConfiguration {
    
    static func pokemonCell(from pokemon: PokemonDetails) -> CollectionCell {
        CollectionCell(data: pokemon)
    }
}
