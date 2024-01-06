//
//  Navigation.swift
//  DEMO APP
//
//  Created by Mubasir Siddiqui on 20/11/23.
//

import UIKit

class Navigation: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if utililtyFunction().isLoggedIn(){
            
            utililtyFunction().navigateToHomeVC(self)
        
        } else {
            utililtyFunction().navigateToLoginVC(self)
        }

    }
}
