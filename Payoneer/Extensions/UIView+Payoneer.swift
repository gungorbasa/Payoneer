//
//  UIView+Payoneer.swift
//  Payoneer
//
//  Created by Gungor Basa on 5/20/21.
//

import UIKit

extension UIView {
  /// Initializes autolayout `view` instance
  class func autolayoutView() -> Self {
    let instance = self.init()
    instance.translatesAutoresizingMaskIntoConstraints = false
    return instance
  }

  /// Tranforms existing view into autolayout
  func autolayoutView() -> Self {
    translatesAutoresizingMaskIntoConstraints = false
    return self
  }
}
