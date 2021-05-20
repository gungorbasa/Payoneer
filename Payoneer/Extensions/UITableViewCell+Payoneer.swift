//
//  UITableViewCell+Payoneer.swift
//  Payoneer
//
//  Created by Gungor Basa on 5/20/21.
//

import UIKit

extension UITableViewCell {
  /// Returns cell's reuse identifier
  static var identifier: String {
    return String(describing: self)
  }
}
