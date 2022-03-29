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
}

private extension SceneRouter {
//    func passDataTo_() {
//        source: SceneDataStore,
//        destination: inout SomewhereDataStore
//    ) {
//    }
}
