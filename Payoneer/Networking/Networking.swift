//
//  Networking.swift
//  Payoneer
//
//  Created by Gungor Basa on 5/20/21.
//

import Combine

protocol Networking {
  func run<T: Decodable>(_ route: Routing, completion: @escaping (Result<T, Error>) -> Void)
  func run<T: Decodable>(_ route: Routing) -> AnyPublisher<T, Error>
}
