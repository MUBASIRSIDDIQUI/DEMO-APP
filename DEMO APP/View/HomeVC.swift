//
//  HomeVC.swift
//  DEMO APP
//
//  Created by Mubasir Siddiqui on 03/11/23.
//

import UIKit

class HomeVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func LogOutBtnTapped(_ sender: Any) {
        print("LogOut Button Tapped")
        utililtyFunction().savelogging(false)
        showLoginScreen()
    }
    
    func showLoginScreen() {
        let loginVC  = LoginVC()
        present(loginVC, animated: true, completion: nil)
    }

}
