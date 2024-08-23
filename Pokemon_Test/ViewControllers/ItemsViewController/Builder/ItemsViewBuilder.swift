//
//  ItemsViewBuilder.swift
//  Pokemon_Test
//
//  Created by Gustavo Carreno on 08/23/24.
//

import UIKit

final class ItemsViewBuilder {
    
    static func build(with itemData: ItemData = .init()) -> ItemsViewController {
        let viewModel = ItemsViewController.ViewModel(title: itemData.title)
        return ItemsViewController(viewModel: viewModel, tableData: .detailedItemsDataSource(from: itemData.items))
    }
}
