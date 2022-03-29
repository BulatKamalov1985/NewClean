//
//  Cell.swift
//  NewClean
//
//  Created by Bulat Kamalov on 29.03.2022.
//

import UIKit
import UIKit
 
class CollectionCellView : UICollectionViewCell {
     
    var label: UILabel?
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.create(frame: frame)
    }
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    private func create(frame: CGRect) {
        self.label = UILabel(frame: frame)
        self.contentView.addSubview(self.label!)
    }
}
