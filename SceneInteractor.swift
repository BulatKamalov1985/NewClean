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

    func requestInitForm(_ request: Scene.InitForm.Request) {
        DispatchQueue.main.async {
            self.presenter.presentInitForm(Scene.InitForm.Response())
        }
    }
}
