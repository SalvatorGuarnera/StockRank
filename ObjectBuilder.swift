//
//  ObjectBuilder.swift
//  StockRank
//
//  Created by Salvator Guarnera on 6/13/20.
//  Copyright © 2020 Spiralus, LLC. All rights reserved.
//

import Foundation
import UIKit

class ObjectBuilder{
    
    static var shared = ObjectBuilder()
    
    func buildLabel(text: String, textSize : CGFloat, textColor: UIColor, textAlignment : NSTextAlignment) -> UILabel{
        
        let label = UILabel()
        label.text = text
        label.textAlignment = textAlignment
        label.textColor = textColor
        label.font = UIFont(name: "HelveticaNeue", size: textSize)
        
        return label
        
    }
    
    func buildButton(text: String, textSize : CGFloat, textColor: UIColor, buttonColor: UIColor, cornerRadius : CGFloat) -> UIButton{
        
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.setTitleColor(textColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: textSize)
        button.backgroundColor = buttonColor
        button.layer.cornerRadius = cornerRadius
        button.layer.masksToBounds = true
        
        return button
        
    }
    
    func appIcon() -> UIImageView{
        let view = UIImageView()
        view.backgroundColor = Constants.shared.GET_PINK()
        view.frame.size = CGSize.init(width: Constants.shared.widthBased(val: 50), height: Constants.shared.widthBased(val: 50))
        return view
    }
    
    
}
