//
//  BaseCell.swift
//  StockRank
//
//  Created by Salvator Guarnera on 8/1/20.
//  Copyright © 2020 Spiralus, LLC. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
