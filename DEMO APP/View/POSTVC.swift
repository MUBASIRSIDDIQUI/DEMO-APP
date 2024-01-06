//
//  POSTVC.swift
//  DEMO APP
//
//  Created by Mubasir Siddiqui on 25/10/23.
//

import UIKit

class POSTVC: UIViewController {
    @IBOutlet weak var responsetxt: UITextView!
    @IBOutlet weak var titletxtField: UITextField!
    @IBOutlet weak var categorytxtField: UITextField!
    @IBOutlet weak var idtxtField: UITextField!
    @IBOutlet weak var pricetxtField: UITextField!
    
    var viewModel: POSTVCViewModel = POSTVCViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func postBtnTapped(_ sender: Any) {
        guard let title = titletxtField.text,
              let category = categorytxtField.text,
              let priceStr = pricetxtField.text,
              let price = Double(priceStr),
              let idStr = idtxtField.text,
              let id = Int(idStr) else {
            print("Invalid input data")
            return
        }
        let product = PostProduct(id: id, title: title, category: category, price: Int(price))
        
        viewModel.postProduct(product: product) { result in
            switch result {
            case .success(let responseProduct):
                print("Response Product: \(responseProduct)")
                DispatchQueue.main.async {
                    self.responsetxt.text = ("\(responseProduct)")
//                    self.responsetxt.text = "Response Product: \(responseProduct)"
                }
            case .failure(let error):
                print("Error: \(error)")
                DispatchQueue.main.async {
                    self.responsetxt.text = "Error: \(error)"
                }
            }
        }
    }
}
//extension UIView{
//    func bindToKeyboard() {
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name:UIResponder.keyboardWillChangeFrameNotification, object: nil)
//    }
//    
//    @objc private func keyboardWillChange(_ notification: NSNotification) {
//        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
//        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
//        let startingFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
//        let endingFrame  = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as!
//            NSValue).cgRectValue
//        let deltaY = endingFrame.origin.y - startingFrame.origin.y
//        
//        UIView.animateKeyframes(withDuration: duration, delay: 0.0,options: KeyframeAnimationOptions.init(rawValue: curve), animations: {
//            self.frame.origin.y += deltaY
//        }, completion: nil)
//    }
//}
//





//var originalFrame: CGRect!
//
//override func viewDidLoad() {
//    super.viewDidLoad()
//
//    // Register for keyboard notifications
//    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//
//    // Store the original frame of the view
//    originalFrame = view.frame
//
//    // Add tap gesture to dismiss the keyboard when tapping outside the text field
//    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
//    view.addGestureRecognizer(tapGesture)
//}
//
//// Handle keyboard appearance
//@objc func keyboardWillShow(_ notification: Notification) {
//    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//        // Adjust the Y position of the view based on the keyboard height
//        view.frame.origin.y -= keyboardSize.height
//    }
//}
//
//// Handle keyboard disappearance
//@objc func keyboardWillHide(_ notification: Notification) {
//    // Reset the Y position of the view to its original value
//    view.frame = originalFrame
//}
//
//// Dismiss the keyboard when tapping outside the text field
//@objc func dismissKeyboard() {
//    view.endEditing(true)
//}
//
//// Unregister from keyboard notifications to avoid memory leaks
//deinit {
//    NotificationCenter.default.removeObserver(self)
//}
//}
