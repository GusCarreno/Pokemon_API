//
//  ItemsViewModel.swift
//  Pokemon_Test
//
//  Created by Gustavo Carreno on 08/23/24.
//

import UIKit

extension ItemsViewController {
    
    // MARK: -
    struct ViewModel {
        let title: String?
        var cleanTitle: String? { title?.cleaned }
    }
}
