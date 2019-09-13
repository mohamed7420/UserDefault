//
//  ViewController.swift
//  UserDefault
//
//  Created by Mohamed on 9/13/19.
//  Copyright © 2019 Mohamed74. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let userDefault = UserDefaults.standard
    
    @IBOutlet weak var segmentedControll: UISegmentedControl!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var userProfile: UIImageView!
    
    var isDark = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentedControll.selectedSegmentIndex = 0
        segmentedControll.addTarget(self, action: #selector(changeBackground), for: .valueChanged)
        customizeImage()
        retrieveData()
      

    }

    
    func customizeImage(){
        
        userProfile.layer.cornerRadius  = userProfile.frame.size.height / 2
        
        userProfile.clipsToBounds       = true
        
    }
    
    func changeViewBackground(){
        
        UIView.animate(withDuration: 0.4) {
        
       self.view.backgroundColor = self.isDark ? UIColor.darkGray : UIColor.white
            
        }
     
   
    }
    
    
    @objc func changeBackground(sender:UISegmentedControl){
        
        isDark = sender.selectedSegmentIndex == 1
        
        saveData()
        
        changeViewBackground()
        
    }
    
    func saveData(){
        
        userDefault.set(isDark, forKey: "Mode")
        
    }
    
    func retrieveData(){
        
        
        let preference = userDefault.bool(forKey: "Mode")
        
        
        if preference {
            
            isDark = true
            changeViewBackground()
            segmentedControll.selectedSegmentIndex = 1
            
        }
        
    }
    
    

}

