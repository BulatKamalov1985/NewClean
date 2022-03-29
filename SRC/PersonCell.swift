//
//  Cell.swift
//  NewClean
//
//  Created by Bulat Kamalov on 29.03.2022.
//

import UIKit
import UIKit
 
class PersonCellView : UICollectionViewCell {
     
    var label: UILabel?
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.create(frame: frame)
    }
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    private func create(frame: CGRect) {
        label = UILabel()
        label?.translatesAutoresizingMaskIntoConstraints = false
        label?.frame.size.height = self.frame.size.height - 10
        label?.frame.size.width = self.frame.size.width - 50
        label?.font = .boldSystemFont(ofSize: 16)
        backgroundColor = .white
        contentView.addSubview(label!)
    }
}
