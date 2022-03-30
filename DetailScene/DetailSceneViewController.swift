//
//  DetailSceneViewController.swift
//  NewClean
//
//  Created by Bulat Kamalov on 30.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class DetailSceneViewController: UIViewController, DetailSceneDisplayLogic {
    
    private let interactor: DetailSceneBusinessLogic
    private let router: DetailSceneRoutingLogic

    init(
        interactor: DetailSceneBusinessLogic,
        router: DetailSceneRoutingLogic
    ) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        title = "Wellcome"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismissSelf))
        initForm()
    }
    
    deinit {
        print("good")
    }
    
    

    
    @objc private func didTapButton() {
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
    
    

    // MARK: - DetailSceneDisplayLogic

    func displayInitForm(_ viewModel: DetailScene.InitForm.ViewModel) {}

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(DetailScene.InitForm.Request())
       
    }
}
