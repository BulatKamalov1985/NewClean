//
//  viewControllerMock.swift
//  NewCleanTests
//
//  Created by Bulat Kamalov on 07.04.2022.
//

import Foundation
@testable import NewClean

final class SceneViewControllerMock: SceneDisplayLogic {
    
    var displayInitFormWasCalled = false
    var viewModel: [ViewModel] = []
    
    func displayInitForm(_ viewModel: [ViewModel]) {
        displayInitFormWasCalled = true
        self.viewModel = viewModel

    }
    
}
