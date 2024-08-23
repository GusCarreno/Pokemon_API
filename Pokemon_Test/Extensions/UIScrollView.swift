//
//  UIScrollView.swift
//  Pokemon_Test
//
//  Created by Gustavo Carreno on 08/23/24.
//

import UIKit

extension UIScrollView {
    var hasScrolledToBottom: Bool {
        let distanceFromBottom = contentSize.height - contentOffset.y
        return distanceFromBottom < frame.size.height * 1.6
    }
}
