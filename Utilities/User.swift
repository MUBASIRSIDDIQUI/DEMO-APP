//
//  User.swift
//  DEMO APP
//
//  Created by Mubasir Siddiqui on 20/11/23.
//

import Foundation
import UIKit



class utililtyFunction: NSObject {
    
    let defaults = UserDefaults.standard
    
//    Variables
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let modalTransitionStyle = UIModalTransitionStyle.crossDissolve
    //    MARK: - Set UserLogin
    func savelogging(_ isLogIn:Bool) {
        defaults.set(isLogIn, forKey: GlobalConstants.userLoginKeys.userlogin)
        defaults.synchronize()
        
    }
//    MARK: - Get UserLogin

    func isLoggedIn() -> Bool {
        return  defaults.bool(forKey: GlobalConstants.userLoginKeys.userlogin)
    }
    
    
    
    func navigateToHomeVC(_ currentViewController: UIViewController) {
        let screen = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        screen.modalTransitionStyle = modalTransitionStyle
        if let navigation  = currentViewController as? Navigation {
            navigation.setViewControllers([screen], animated : true)
        } else {
            currentViewController.navigationController?.setViewControllers([screen], animated: true)
        }
    }
    
    
    
    func navigateToLoginVC(_ currentViewController:UIViewController) {
        
        let screen = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        screen.modalTransitionStyle = modalTransitionStyle
        if let navigation = currentViewController as? Navigation {
            navigation.setViewControllers([screen], animated: true)
        } else {
            currentViewController.navigationController?.setViewControllers([screen], animated: true)
        }
    }
}
