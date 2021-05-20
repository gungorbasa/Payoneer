//
//  Network.swift
//  Payoneer
//
//  Created by Gungor Basa on 5/20/21.
//

import Foundation

struct Networks: Codable {
  let applicable: [Network]
}

struct Network: Codable {
  let code: String
  let label: String
  let links: PaymentLink
}
