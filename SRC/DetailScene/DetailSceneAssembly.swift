//
//  DetailSceneAssembly.swift
//  NewClean
//
//  Created by Bulat Kamalov on 30.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum DetailSceneAssembly {
    static func build() -> UIViewController {
        let presenter = DetailScenePresenter()
        let worker = DetailSceneWorker()
        let interactor = DetailSceneInteractor(presenter: presenter, worker: worker)
        let router = DetailSceneRouter(dataStore: interactor)
        let viewController = DetailSceneViewController(interactor: interactor, router: router)

        presenter.viewController = viewController
        router.viewController = viewController

        return viewController
    }
}
