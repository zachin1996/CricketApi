//
//  ViewController.swift
//  weather
//
//  Created by Sachin on 29/05/19.
//  Copyright © 2019 Sachin. All rights reserved.
//

import UIKit
import TextFieldEffects
class ViewController: UIViewController,UITextFieldDelegate{
    
    @IBOutlet weak var mobileTextfield: HoshiTextField!
    
    @IBOutlet weak var schoolcodeField: HoshiTextField!
    @IBOutlet weak var passwordTextfield: HoshiTextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
    }
    @IBOutlet weak var viewShadow: UIView!
    var userName = ""
    var passWord = 123
    let letters = CharacterSet.letters
    let digits = CharacterSet.decimalDigits
    
    
    
    func validate(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{3}\\d{3}\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //return Int(string) != nil
        return string == "" || Int(string) != nil
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        
        if (mobileTextfield.text != nil) && (passwordTextfield.text == passWord.description){
            
            let user = mobileTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
           
            if validate(value: user) == false{
                let alertC = UIAlertController.init(title: "Info", message: "Please enter a valid mobile number", preferredStyle: .alert)
                let defaultA = UIAlertAction.init(title: "ok", style: .default, handler: nil)
                alertC.addAction(defaultA)
                present(alertC, animated: true, completion: nil)
            }
            else if ( user != userName) {
                
                performSegue(withIdentifier: "Home", sender: nil)
            }

            
            
            
        }
        else {
            let alertC = UIAlertController.init(title: "sorry!!!", message: "wrong password", preferredStyle: .alert)
            let defaultA = UIAlertAction.init(title: "ok", style: .default, handler: nil)
            let defaultB = UIAlertAction.init(title: "cancel", style: .default, handler: nil)
            alertC.addAction(defaultA)
            alertC.addAction(defaultB)
            
            present(alertC, animated: true, completion: nil)
            
        }
//        UserDefaults.standard.set(Any?.self, forKey: "login")
//            mobileTextfield.text = ""
     
        
//    override func viewDidAppear(_ animated: Bool) {
//        if  let x = UserDefaults.standard.object(forKey: "login"){
//            performSegue(withIdentifier: "Home", sender: nil)
//        }
     UserDefaults.standard.set(true, forKey: Constants.preferacne.logout)
  }

                
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mobileTextfield.delegate = self
       viewShadow.dropShadow()
//        mobileTextfield.setBorder()
//        mobileTextfield.setPadding()
        self.navigationController?.isNavigationBarHidden=true
      //  mobileTextfield.placeholderFontScale = 0.3
       loginButton.buttonshadow()
        
}
}
extension UIView{
    func dropShadow() {
        
        var shadowLayer: CAShapeLayer!
        let cornerRadius: CGFloat = 16.0
        let fillColor: UIColor = .white
        
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
            shadowLayer.fillColor = fillColor.cgColor
            shadowLayer.shadowColor = UIColor.gray.withAlphaComponent(0.5).cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0, height: 0)
            shadowLayer.shadowOpacity = 0.6
            shadowLayer.shadowRadius = 20
            
            layer.insertSublayer(shadowLayer, at: 0)
        }
    }}
extension UIButton{
func buttonshadow(){
        self.layer.shadowColor = UIColor.blue.cgColor
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 1.0
    
    }
}
//extension UITextField {
//    func setPadding(){
//        let paddingView = UIView(frame: CGRect( x: 0, y: 0, width: 10, height: self.frame.height))
//        self.leftView = paddingView
//        self.leftViewMode = .always
//
//    }
//    func setBorder()  {
//
//        self.borderStyle = .none
//        self.layer.backgroundColor = UIColor.black.cgColor
//        self.layer.masksToBounds = false
//        self.layer.shadowColor = UIColor.white.cgColor
//        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
//        self.layer.shadowOpacity = 0.0
//        self.layer.shadowRadius = 0.0
//    }
//}


