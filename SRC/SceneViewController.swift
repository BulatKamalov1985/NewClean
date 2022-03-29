//
//  SceneViewController.swift
//  NewClean
//
//  Created by Bulat Kamalov on 28.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class SceneViewController: UIViewController, SceneDisplayLogic {
    
    var collectionView: UICollectionView!
    var persons: [Person]? {
        didSet {
            print(persons?.count ?? 1)
        }
    }
    private var layout : UICollectionViewFlowLayout {
        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let boundSize: CGSize = UIScreen.main.bounds.size
        layout.itemSize = CGSize(width: boundSize.width, height: 50)
        return layout
    }
    
    
    private let interactor: SceneBusinessLogic
    private let router: SceneRoutingLogic
    
    init(
        interactor: SceneBusinessLogic,
        router: SceneRoutingLogic
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
        initForm()
        setupCollectionView()
        self.view.addSubview(collectionView!)
    }
    
    func setupCollectionView() {
        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: self.layout)
        self.collectionView?.backgroundColor = UIColor.yellow
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView?.register(CollectionCellView.self, forCellWithReuseIdentifier: "cell")
    }
    // MARK: - SceneDisplayLogic
    
    func displayInitForm(_ viewModel: ViewModel) {
        let person = viewModel.person
        self.persons = person
        collectionView?.reloadData()
        print(person.count)
    }
    
    // MARK: - Private
    
    private func initForm() {
        interactor.requestInitForm(RequestModel())
    }
}

extension SceneViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return persons?.count ?? 1
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : CollectionCellView = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionCellView
        cell.label?.text = persons?[indexPath.row].firstName
        
        return cell
    }
}
