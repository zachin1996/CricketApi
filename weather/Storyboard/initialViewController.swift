//
//  initialViewController.swift
//  weather
//
//  Created by Sachin on 31/05/19.
//  Copyright © 2019 Sachin. All rights reserved.
//

import UIKit

class initialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
       let a = UserDefaults.standard.bool(forKey: Constants.preferacne.logout)
            
        
        print("userDe",a)
        
        
        
        if a == true {
            performSegue(withIdentifier: "load", sender: nil)
        }
        else {
            performSegue(withIdentifier: "login", sender: nil)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
}
