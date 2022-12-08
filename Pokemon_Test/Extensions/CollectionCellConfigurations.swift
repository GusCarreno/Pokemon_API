//
//  CollectionCellConfigurations.swift
//  Pokemon_Test
//
//  Created by Gustavo Carreno on 07/12/22.
//

import Foundation

typealias CollectionCell = CollectionCellConfiguration<PokedexCell, PokemonDetails>

extension CollectionCellConfiguration {
    
    static func pokemonCell(from pokemon: PokemonDetails) -> CollectionCell {
        CollectionCell(data: pokemon)
    }
}
