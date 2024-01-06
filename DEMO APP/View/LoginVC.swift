//
//  LoginVC.swift
//  DEMO APP
//
//  Created by Mubasir Siddiqui on 02/11/23.
//

import UIKit

class LoginVC: UIViewController {
    
//    let userDefaults = UserDefaults.standard
//    let isLoggedInKey = "isLoggedIn"
    
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    let  email: String = "101"
    let password: String = "pass"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    
    @IBAction func loginBtnTapped(_ sender: Any){
        UserDefaults.standard.synchronize()

        
        
// Get the provided username and password from the text fields
//        if let email = emailTxtField.text, let password = passwordTxtField.text {
//            
// Create a user object with the provided credentials
//            let user = UserCred(email: email, password: password)
            
            
        if email == emailTxtField.text! && password == passwordTxtField.text! {
            UserDefaults.standard.set(email, forKey: "isLoggedIn")
            UserDefaults.standard.synchronize()
            utililtyFunction().savelogging(true)
            let vc = storyboard?.instantiateViewController(identifier: "HomeVC")
                navigationController?.pushViewController(vc!, animated: true)
                } else {
                    // Invalid credentials, handle the error or provide feedback to the user.
                    let alert = UIAlertController(title: "alert", message: "Incorrect Credentials!", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(ok)
                    present(alert, animated: true, completion: nil)
                
        }
    }
}



//{
//    if let email = emailTxtField.text, let password = passwordTxtField.text {
//        let user = UserCred(email: email, password: password)
//        
//        if let storedUserData = UserDefaults.standard.data(forKey: "userData"),
//           let storedUser = try? JSONDecoder().decode(UserCred.self, from: storedUserData) {
//            if user.email == storedUser.email && user.password == storedUser.password {
//                
//            } else {

//
//            
//        }
//    }
//}
