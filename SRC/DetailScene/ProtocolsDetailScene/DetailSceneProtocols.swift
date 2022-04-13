//
//  DetailSceneProtocols.swift
//  NewClean
//
//  Created by Bulat Kamalov on 30.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol DetailSceneDataPassing {
    var dataStore: DetailSceneDataStore { get }
}

protocol DetailSceneDataStore {}

protocol DetailSceneBusinessLogic {
    func requestInitForm(_ request: DetailScene.InitForm.Request)
}

protocol DetailSceneWorkerLogic {}

protocol DetailScenePresentationLogic {
    func presentInitForm(_ response: DetailScene.InitForm.Response)
}

protocol DetailSceneDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: DetailScene.InitForm.ViewModel)
}

protocol DetailSceneRoutingLogic {}
