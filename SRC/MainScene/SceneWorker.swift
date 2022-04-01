//
//  SceneWorker.swift
//  NewClean
//
//  Created by Bulat Kamalov on 28.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

final class SceneWorker: SceneWorkerLogic, NetworkSession {
    
    var session: URLSession
    
    init(
        session: URLSession = URLSession(configuration: .default)
    ) {
        self.session = session
    }
    
    func get(_ request: RequestModel, completion: @escaping ([ResponseModel]?) -> Void) {
        
        let endPoint: EndpointType = EndPoint()
        network(endPoint: endPoint) { (result: Result<[ResponseModel], NeworkError>) in
            switch result {
            case .success(let success):
                completion(success)
            case .failure(_):
                completion([])
            }
        }
        
    }
    
}
private struct EndPoint: EndpointType {
    var path: String = "https://jsonplaceholder.typicode.com/posts"
}



extension EndpointType {
    var url: URL? {
        return URLComponents(string: path)?.url
    }
}

extension NetworkSession {
    func network<Success: Decodable>(endPoint: EndpointType, completion: @escaping (Result<Success, NeworkError>) -> Void) {
        guard
            let url = endPoint.url
        else {
            completion(.failure(.badRequest))
            return
        }
        let task = session.dataTask(with: url ) { data,respose, error in
            if let data = data {
                do {
                    let person = try JSONDecoder().decode(Success.self, from: data)
                    completion(.success(person))
                    print("Have Parsed")
                } catch {
                    completion(.failure(.badRequest))
                    print(error.localizedDescription)
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

enum NeworkError: Error {
    case badRequest
}
