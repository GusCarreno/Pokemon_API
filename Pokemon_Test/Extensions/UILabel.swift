//
//  UILabel.swift
//  Pokemon_Test
//
//  Created by Gustavo Carreno on 08/23/24.
//

import UIKit

extension UILabel {
    static var accessoryView: UILabel {
        let label = UILabel()
        label.textColor = .white
        label.font = .pixel17
        label.text = ">"
        label.sizeToFit()
        return label
    }
}
