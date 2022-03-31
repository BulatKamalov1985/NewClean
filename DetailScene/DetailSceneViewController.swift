//
//  DetailSceneViewController.swift
//  NewClean
//
//  Created by Bulat Kamalov on 30.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class DetailSceneViewController: UIViewController, DetailSceneDisplayLogic {
    
    var label = UILabel()
    
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
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back",
                                                           style: .plain, target: self,
                                                           action: #selector(dismissSelf))
        initForm()
        createLabel()
    }
    
    deinit {
        print("Deinit")
    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
    
    func createLabel() {
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 12
        label.font = .boldSystemFont(ofSize: 40)
        label.center = CGPoint(x: 190, y: 400)
        label.textAlignment = .center
        label.backgroundColor = .white
        label.text = "GO BACK"
        view.addSubview(label)
    }
    
    
    
    

    // MARK: - DetailSceneDisplayLogic

    func displayInitForm(_ viewModel: DetailScene.InitForm.ViewModel) {}

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(DetailScene.InitForm.Request())
       
    }
}
