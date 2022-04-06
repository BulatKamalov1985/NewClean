//
//  SceneViewController.swift
//  NewClean
//
//  Created by Bulat Kamalov on 28.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class SceneViewController: UIViewController, SceneDisplayLogic {
    
    var collectionView: UICollectionView!
    var person: [ViewModel]?
    
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
    }
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .systemMint
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PersonCellView.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        // section -> group -> items -> size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize:  itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5,
                                                     bottom: 5, trailing: 5)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize ,
                                                       subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    // MARK: - SceneDisplayLogic
    
    func displayInitForm(_ viewModel: [ViewModel]) {
        person = viewModel
        collectionView?.reloadData()
        print(person?.count ?? 1)
    }
    
    // MARK: - Private
    
    private func initForm() {
        interactor.requestInitForm(RequestModel())
    }
}

extension SceneViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return person?.count ?? 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : PersonCellView = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PersonCellView
        
        cell.label.text = person?[indexPath.row].id.description
        cell.backgroundColor = person?[indexPath.row].cellColor
        cell.layer.borderWidth = 3
//        cell.layer.backgroundColor = .init(gray: 44, alpha: 0.7)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        router.routeTo()
    }
}
