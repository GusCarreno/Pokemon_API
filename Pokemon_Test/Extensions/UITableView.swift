//
//  UITableView.swift
//  Pokemon_Test
//
//  Created by Gustavo Carreno on 08/23/24.
//

import UIKit

extension UITableView {

    func cell<Cell: UITableViewCell>(at indexPath: IndexPath) -> Cell? {
        cellForRow(at: indexPath) as? Cell
    }
    
    func registerCell<Cell: UITableViewCell>(_ cell: Cell.Type) {
        register(cell, forCellReuseIdentifier: String(describing: cell))
    }

    func dequeueCell<Cell: UITableViewCell>(for item: TableCellConfigurator) -> Cell {
        dequeueReusableCell(withIdentifier: type(of: item).reuseId) as! Cell
    }
}
