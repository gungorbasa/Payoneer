//
//  Routing.swift
//  Payoneer
//
//  Created by Gungor Basa on 5/20/21.
//

import Foundation

protocol Routing {
  var host: String { get }
  var path: String { get }
  var headers: [String: String] { get }
  var parameters: [String: Any] { get }
  var body: [String: Any] { get }
  var method: HTTPMethod { get }
}
