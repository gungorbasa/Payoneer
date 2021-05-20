//
//  HTTPMethod.swift
//  Payoneer
//
//  Created by Gungor Basa on 5/20/21.
//

import Foundation

enum HTTPResponseError: Error {
  case badURL
}

enum HTTPMethod: String {
  case get = "GET"
  case post = "POST"
  case put = "PUT"
  case delete = "DELETE"
}
