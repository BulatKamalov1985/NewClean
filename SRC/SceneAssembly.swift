//
//  SceneAssembly.swift
//  NewClean
//
//  Created by Bulat Kamalov on 28.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum SceneAssembly {
    static func build() -> UIViewController {
        
        let presenter = ScenePresenter()
        let worker = SceneWorker()
        let interactor = SceneInteractor(presenter: presenter, worker: worker)
        let router = SceneRouter(dataStore: interactor)
        let viewController = SceneViewController(interactor: interactor, router: router)

        presenter.viewController = viewController
        router.viewController = viewController

        return viewController
    }
}
