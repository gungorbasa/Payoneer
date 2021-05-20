//
//  NativeNetwork.swift
//  Payoneer
//
//  Created by Gungor Basa on 5/20/21.
//

import Foundation
import Combine

final class NativeNetwork {
  private let session: URLSession = .shared
  private let jsonDecoder: JSONDecoder

  public init(decoder: JSONDecoder) {
    self.jsonDecoder = decoder
  }
}


extension NativeNetwork: Networking {
  func run<T: Decodable>(_ route: Routing) -> AnyPublisher<T, Error> {
    let request = URLRequest(route)!
    return URLSession.shared.dataTaskPublisher(for: request)
      .map { $0.data }
      .decode(type: T.self, decoder: jsonDecoder)
      .eraseToAnyPublisher()
  }

  func run<T: Decodable>(_ route: Routing, completion: @escaping (Result<T, Error>) -> Void) {
    guard let request = URLRequest(route) else {
      completion(.failure(HTTPResponseError.badURL))
      return
    }
    let dataTask = session.dataTask(with: request) { [weak self] result in
      guard let self = self else { return }
      switch result {
      case .success((_, let data)):
        do {
          let object  = try self.jsonDecoder.decode(T.self, from: data)
          completion(.success(object))
        } catch let error {
          completion(.failure(error))
        }
      case .failure(let error):
        completion(.failure(error))
      }
    }
    dataTask.resume()
  }
}
