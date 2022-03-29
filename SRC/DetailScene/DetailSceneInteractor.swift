//
//  DetailSceneInteractor.swift
//  NewClean
//
//  Created by Bulat Kamalov on 30.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
import Foundation

final class DetailSceneInteractor: DetailSceneBusinessLogic, DetailSceneDataStore {
    
    private let presenter: DetailScenePresentationLogic
    private let worker: DetailSceneWorkerLogic

    init(
        presenter: DetailScenePresentationLogic,
        worker: DetailSceneWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func requestInitForm(_ request: DetailScene.InitForm.Request) {
        DispatchQueue.main.async {
            self.presenter.presentInitForm(DetailScene.InitForm.Response())
        }
    }
}
