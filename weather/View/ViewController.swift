//
//  ViewController.swift
//  weather
//
//  Created by Sachin on 29/05/19.
//  Copyright © 2019 Sachin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{
    @IBOutlet weak var mobileTextfield: UITextField!
    @IBOutlet weak var schoolCodeTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
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
        getdata()
        
}
    func  getdata(){
        APIManager.sharedInstance.getPostid(urlToPost: "", OnSuccess:{(response) in
            
            print("response is ",response)
            
        })
        {(error) in
            print("error",error)
        }
        
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
            shadowLayer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0, height: 0)
            shadowLayer.shadowOpacity = 0.8
            shadowLayer.shadowRadius = 4
            
            layer.insertSublayer(shadowLayer, at: 0)
        }
    }
}


