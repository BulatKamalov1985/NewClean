//
//  DetailScenePresenter.swift
//  NewClean
//
//  Created by Bulat Kamalov on 30.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

final class DetailScenePresenter: DetailScenePresentationLogic {
    weak var viewController: DetailSceneDisplayLogic?

    func presentInitForm(_ response: DetailScene.InitForm.Response) {
        viewController?.displayInitForm(DetailScene.InitForm.ViewModel())
    }
}
