//
//  SceneProtocols.swift
//  NewClean
//
//  Created by Bulat Kamalov on 28.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol SceneDataPassing {
    var dataStore: SceneDataStore { get }
}

protocol SceneDataStore {}

protocol SceneBusinessLogic {
    func requestInitForm(_ request: Scene.InitForm.Request)
}

protocol SceneWorkerLogic {}

protocol ScenePresentationLogic {
    func presentInitForm(_ response: Scene.InitForm.Response)
}

protocol SceneDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: Scene.InitForm.ViewModel)
}

protocol SceneRoutingLogic {}
