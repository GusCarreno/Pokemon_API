//
//  Int.swift
//  Pokemon_Test
//
//  Created by Gustavo Carreno on 08/23/24.
//

import Foundation

extension Int {
    var meter: String { String(format: "%.1f m", Double(self) / 10.0) }
    var kilo: String { String(format: "%.1f kg", Double(self) / 10.0) }
}
