//
//  Constants.swift
//  StockRank
//
//  Created by Salvator Guarnera on 6/13/20.
//  Copyright © 2020 Spiralus, LLC. All rights reserved.
//

import Foundation
import UIKit

class Constants{
    
    static var shared = Constants()
    
    func widthBased(val : CGFloat) -> CGFloat{
        return (UIScreen.main.bounds.width) * (val / 414)
    }
    
    func heightBased(val : CGFloat) -> CGFloat{
        return (UIScreen.main.bounds.height) * (val / 896)
    }
    
    func GET_PINK() -> UIColor{
        UIColor(red: 240 / 255.0, green: 37 / 255.0, blue: 233 / 255.0, alpha: 1)
    }
    
    func GET_BLUE() -> UIColor{
        return UIColor(red: 16 / 255.0, green: 115 / 255.0, blue: 224 / 255.0, alpha: 1)
    }
    
    func GET_PURPLE() -> UIColor{
        UIColor(red: 137 / 255.0, green: 43 / 255.0, blue: 233 / 255.0, alpha: 1)
    }
    
}
