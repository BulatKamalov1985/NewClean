//
//  DetailSceneRouter.swift
//  NewClean
//
//  Created by Bulat Kamalov on 30.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class DetailSceneRouter: DetailSceneRoutingLogic, DetailSceneDataPassing {
    weak var viewController: UIViewController?
    let dataStore: DetailSceneDataStore

    init(dataStore: DetailSceneDataStore) {
        self.dataStore = dataStore
    }
}

private extension DetailSceneRouter {
//    func passDataTo_() {
//        source: DetailSceneDataStore,
//        destination: inout SomewhereDataStore
//    ) {
//    }
}
