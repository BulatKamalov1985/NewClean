//
//  SceneViewController.swift
//  NewClean
//
//  Created by Bulat Kamalov on 28.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class SceneViewController: UIViewController, SceneDisplayLogic {
    
    var collectionView: UICollectionView!
    var persons: [Person]?
    
//    private var layout : UICollectionViewFlowLayout {
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 5
//        return layout
//    }
    
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
        collectionView.backgroundColor = UIColor.systemGray
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
        let cell : PersonCellView = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PersonCellView
        
        cell.label?.text = persons?[indexPath.row].firstName
        cell.layer.borderWidth = 1
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailSceneViewController(interactor: interactor, router: router)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//extension SceneViewController : UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView,
//        layout collectionViewLayout: UICollectionViewLayout,
//        sizeForItemAt indexPath: IndexPath
//    ) -> CGSize {
//        return CGSize(width: self.collectionView.frame.size.width , height: 70)
//    }
//}

