//
//  ScenePresenter.swift
//  NewClean
//
//  Created by Bulat Kamalov on 28.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

final class ScenePresenter: ScenePresentationLogic {
    weak var viewController: SceneDisplayLogic?

    func presentInitForm(_ response: ResponseModel) {
        viewController?.displayInitForm(ViewModel(person: response.person))
    }
}
