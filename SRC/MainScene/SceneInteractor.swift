//
//  SceneInteractor.swift
//  NewClean
//
//  Created by Bulat Kamalov on 28.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
import Foundation


final class SceneInteractor: SceneBusinessLogic, SceneDataStore {
    
    private let presenter: ScenePresentationLogic
    private let worker: SceneWorkerLogic
    
    init(
        presenter: ScenePresentationLogic,
        worker: SceneWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }
    
    func requestInitForm(_ request: RequestModel) {
        worker.get(request) { [weak self] result in

            DispatchQueue.main.async{
                switch result {
                case .success(let person):
                    
                    let filtred = person?.filter{$0.id! % 2 != 0}
                    let person = filtred?.enumerated().filter { $0.0 % 2 == 1 }.map { $0.1 }
                    
                    self?.presenter.presentInitForm(person ?? [])
                case .failure(_): return
                }
            }
        }
    }
}
