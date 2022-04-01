//
//  NetworkSession.swift
//  NewClean
//
//  Created by Bulat Kamalov on 01.04.2022.
//

import Foundation

protocol EndpointTypeProtocol {
    var path: String { get set }
}

protocol NetworkSessionProtocol {
    func network<Success: Decodable>(endpoint: EndpointTypeProtocol, completion: @escaping (Result<Success, NetworkError>) -> Void)
    var session: URLSession { get set }
}

extension EndpointTypeProtocol {
    var url: URL? {
        return URLComponents(string: path)?.url
    }
}

extension NetworkSessionProtocol {
    func network<Success: Decodable>(endpoint: EndpointTypeProtocol, completion: @escaping (Result<Success, NetworkError>) -> Void) {
        guard let url = endpoint.url else {
            completion(.failure(.badRequest))
            return
        }
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let person = try JSONDecoder().decode(Success.self, from: data)
                    completion(.success(person))
                } catch {
                    completion(.failure(.badRequest))
                    return
                }
            } else {
                completion(.failure(.badRequest))
                return
            }
        }
        task.resume()
    }
}

enum NetworkError: Error {
    case badRequest
}
