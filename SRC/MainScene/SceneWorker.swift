//
//  SceneWorker.swift
//  NewClean
//
//  Created by Bulat Kamalov on 28.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

final class SceneWorker: SceneWorkerLogic, NetworkSessionProtocol {
    
    var session: URLSession
    
    init(
        session: URLSession = URLSession(configuration: .default)
    ) {
        self.session = session
    }
    
    func get(_ request: RequestModel, completion: @escaping (Result<[ResponseModel]?, NetworkError>) -> Void) {
        
        let endPoint: EndpointTypeProtocol = EndPoint()
        let completionWrapper: (Result<[ResponseModel]?, NetworkError>) -> Void = { result in
            switch result {
            case .success(let succes):
                completion(.success(succes))
            case .failure(_):
                completion(.failure(.badRequest))
            }
        }
        network(endpoint: endPoint, completion: completionWrapper)
    }
}

private struct EndPoint : EndpointTypeProtocol {
    var path: String = "https://jsonplaceholder.typicode.com/posts"
}



