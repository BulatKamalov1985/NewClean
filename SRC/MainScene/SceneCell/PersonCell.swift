//
//  Cell.swift
//  NewClean
//
//  Created by Bulat Kamalov on 29.03.2022.
//

import UIKit
import UIKit
 
class PersonCellView : UICollectionViewCell {
     
    var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.create()
    }
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    private func create() {
        label = UILabel()
        label.textColor = .yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.frame.size.height = self.frame.size.height
        label.frame.size.width = self.frame.size.width
        label.font = .boldSystemFont(ofSize: 50)
       
        label.textAlignment = .center
        contentView.addSubview(label)
    }
}
