//
//  ScenePresenter.swift
//  NewClean
//
//  Created by Bulat Kamalov on 28.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
import Foundation

final class ScenePresenter: ScenePresentationLogic {
    
    weak var viewController: SceneDisplayLogic?
    
    func presentInitForm(_ response: [ResponseModel]) {
//        viewController?.displayInitForm(response.map{ .init(response: $0)})
        var viewModel: [ViewModel] = []
        for (index, value) in response.enumerated() {
            viewModel.append(ViewModel(response: value, index: index))
        }
        viewController?.displayInitForm(viewModel)
    }
}

