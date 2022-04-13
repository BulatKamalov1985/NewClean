//
//  SceneRouter.swift
//  NewClean
//
//  Created by Bulat Kamalov on 28.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class SceneRouter: SceneRoutingLogic, SceneDataPassing {
    
    weak var viewController: UIViewController?
    let dataStore: SceneDataStore

    init(dataStore: SceneDataStore) {
        self.dataStore = dataStore
    }
    
    func routeTo() {
        let rootVC = DetailSceneAssembly.build()
        let navigationController = UINavigationController(rootViewController: rootVC)
        navigationController.navigationBar.backgroundColor = .systemRed
        navigationController.modalPresentationStyle = .fullScreen
        
        viewController?.present(navigationController, animated: true, completion: nil)
    }
}

private extension SceneRouter {
//    func passDataTo_() {
//        source: SceneDataStore,
//        destination: inout SomewhereDataStore
//    ) {
//    }
    
}
