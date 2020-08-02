//
//  IntroductionViewController.swift
//  StockRank
//
//  Created by Salvator Guarnera on 6/13/20.
//  Copyright © 2020 Spiralus, LLC. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {

    let appIcon = ObjectBuilder.shared.appIcon()
    
    let introLabel = ObjectBuilder.shared.buildLabel(text: "StockRank allows you to sort stocks listed on the S&P500 based on various fundamentals and figures", textSize: Constants.shared.widthBased(val: 20), textColor: UIColor.darkGray, textAlignment: .center)
    
    let continueButton = ObjectBuilder.shared.buildButton(text: "Get Started", textSize: Constants.shared.widthBased(val: 18), textColor: UIColor.white, buttonColor: Constants.shared.GET_BLUE(), cornerRadius: 15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    
    func setupConstraints(){
        
        self.view.addSubview(appIcon)
        appIcon.translatesAutoresizingMaskIntoConstraints = false
        appIcon.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: Constants.shared.widthBased(val: 10)).isActive = true
        appIcon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        appIcon.widthAnchor.constraint(equalToConstant: Constants.shared.widthBased(val: 50)).isActive = true
        appIcon.heightAnchor.constraint(equalToConstant: Constants.shared.widthBased(val: 50)).isActive = true
        
        self.view.addSubview(introLabel)
        introLabel.translatesAutoresizingMaskIntoConstraints = false
        introLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        introLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -UIScreen.main.bounds.height * 0.1).isActive = true
        introLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.7).isActive = true
        
        introLabel.numberOfLines = 0
        
        self.view.addSubview(continueButton)
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.topAnchor.constraint(equalTo: self.view.centerYAnchor, constant: UIScreen.main.bounds.width * 0.1).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.3).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.125).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        continueButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        continueButton.addTarget(self, action: #selector(buttonHeld), for: .touchDown)
        continueButton.addTarget(self, action: #selector(buttonCancel), for: .touchDragExit)
        
    }
    
    @objc func buttonPressed(sender : UIButton){
        sender.alpha = 1
        if let navigator = self.navigationController{
            if let nextView = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as? HomeViewController{
                navigator.pushViewController(nextView, animated: true)
            }
        }
    }
    
    @objc func buttonHeld(sender : UIButton){
        sender.alpha = 0.75
    }
    
    @objc func buttonCancel(sender : UIButton){
        sender.alpha = 1
    }
    
}
