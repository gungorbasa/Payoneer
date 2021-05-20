//
//  PaymentRoutes.swift
//  Payoneer
//
//  Created by Gungor Basa on 5/20/21.
//

import Foundation

enum PaymentRoutes: Routing {
  case paymentList

  var host: String { "https://raw.githubusercontent.com/optile/checkout-android/develop/shared-test/" }
  var path: String {
    switch self {
    case .paymentList:
      return "lists/listresult.json"
    }
  }
  var headers: [String : String] { return [:] }
  var parameters: [String : Any] { return [:] }
  var body: [String : Any] { return [:] }
  var method: HTTPMethod { .get }
}
