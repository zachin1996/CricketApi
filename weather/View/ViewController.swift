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
    
    func validateEmpty(value: String?) -> Bool {
        
        if value == nil {
            return false
        }else if value == "" {
            return false
        }else {
            return true
        }
        
    }
    
    
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print("what is this")
//        //return Int(string) != nil
//        return string == "" || Int(string) != nil
//    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        
        if (mobileTextfield.text != nil) || (passwordTextfield.text == passWord.description){
            
            let user = mobileTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if (((validateEmpty(value: mobileTextfield.text) == false) && (validateEmpty(value: schoolcodeField.text) == false)) || ((validateEmpty(value: schoolcodeField.text) == false) && (validateEmpty (value: passwordTextfield.text) == false)) || ((validateEmpty (value: passwordTextfield.text) == false) && (validateEmpty(value: mobileTextfield.text) == false))) {
                
                let alertK = UIAlertController.init(title: "Oops!", message: "please fill the empty fields", preferredStyle: .alert)
                let defaultL = UIAlertAction.init(title: "ok", style: .default, handler: nil)
                alertK.addAction(defaultL)
                present(alertK, animated: true, completion: nil)
            }
            
            
            if validateEmpty(value: mobileTextfield.text) == false{
                let alertI = UIAlertController.init(title: "Info!!!", message: "please enter mobile number", preferredStyle: .alert)
                let defaultJ = UIAlertAction.init(title: "ok", style: .default, handler: nil)
                alertI.addAction(defaultJ)
                
                present(alertI, animated: true, completion: nil)
            }
            
            if validate(value: user) == false{
                let alertC = UIAlertController.init(title: "Info", message: "Please enter a valid mobile number", preferredStyle: .alert)
                let defaultA = UIAlertAction.init(title: "ok", style: .default, handler: nil)
                alertC.addAction(defaultA)
                present(alertC, animated: true, completion: nil)
            }
            
                
            if validateEmpty(value: schoolcodeField.text) == false{
                let alertB = UIAlertController.init(title: "Info!!!", message: "please enter schoolfield", preferredStyle: .alert)
                let defaultD = UIAlertAction.init(title: "ok", style: .default, handler: nil)
                alertB.addAction(defaultD)
                
                present(alertB, animated: true, completion: nil)
            }
            
            if passwordTextfield.text == nil {
                print("Password NILLLLLLLLLL")
            }else {
                print("Password NOTTTTTTTT NILLLLLLLLLL")

            }
            
            if validateEmpty (value: passwordTextfield.text) == false {
                let alertE = UIAlertController.init(title: "Info!!!", message: "Please enter password", preferredStyle: .alert)
                let defaultF = UIAlertAction.init(title: "ok", style: .default, handler: nil)
                alertE.addAction(defaultF)
                present(alertE, animated: true, completion: nil)
            }
            
             if !passwordTextfield.text!.elementsEqual(123.description) {
                
                let alertG = UIAlertController.init(title: "sorry!!!", message: "wrong password", preferredStyle: .alert)
                let defaultH = UIAlertAction.init(title: "ok", style: .default, handler: nil)
                alertG.addAction(defaultH)
                present(alertG, animated: true, completion: nil)
            }

                
                
                
            else if ( user != userName) {
                
                performSegue(withIdentifier: "Home", sender: nil)
            }
            
        }
//        UserDefaults.standard.set(Any?.self, forKey: "login")
//            mobileTextfield.text = ""
     
        
//    override func viewDidAppear(_ animated: Bool) {
//        if  let x = UserDefaults.standard.object(forKey: "login"){
//            performSegue(withIdentifier: "Home", sender: nil)
//        }
     UserDefaults.standard.set(true, forKey: Constants.preferacne.logout)
  }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("shouldChangeCharactersIn")
        if textField == mobileTextfield{
            let text = textField.text!
            let newLength = text.count + string.count
            print("count",text.count,"str-",string.count)
            return newLength <= 10 && (string == "" || Int(string) != nil)
        }
        else{
            return true
        }


    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
          mobileTextfield.delegate = self
          viewShadow.dropShadow()
          self.navigationController?.isNavigationBarHidden=true
          loginButton.buttonshadow()
//        mobileTextfield.setBorder()
//        mobileTextfield.setPadding()
//  mobileTextfield.placeholderFontScale = 0.3
       
        
        
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
        self.layer.shadowOffset = CGSize(width: 4, height: 20)
        self.layer.shadowRadius = 30
        self.layer.shadowOpacity = 0.5
    
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


