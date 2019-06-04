//
//  APIManager.swift
//  weather
//
//  Created by Sachin on 03/06/19.
//  Copyright © 2019 Sachin. All rights reserved.
//

import UIKit

class APIManager: NSObject {
    let baseURL = "https://cricapi.com/api/"
    static let endPoints = "?apikey=fJquls0ezGbD5f5xGJ40cyi4fcI2"//"fJquls0ezGbD5f5xGJ40cyi4fcI2"
     static let sharedInstance =  APIManager()
    
    
    
   // let paramData = JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
    
    
    func getPostid(urlToPost:String,OnSuccess:@escaping([String: Any])-> Void,onFailure:@escaping(Error)->Void){
        let urlString = baseURL + urlToPost + APIManager.endPoints// + String(postId)
        let url = URL(string: urlString)
        let request:NSMutableURLRequest = NSMutableURLRequest(url: url!)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let task = session.dataTask(with: request as  URLRequest, completionHandler: {data,response,error->Void in
            
            
            if(error != nil){
                onFailure(error!)
                
            }
            else {
                let jsonResult = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String : Any]
                print("jsonresult",jsonResult)
                
               //                let matches = jsonResult["matches"] as? [[String: Any]]
//
//                let item = matches[indexPath.row]
//                let date = item["date"] as! String
//                dateLBL.text =  date
                
                OnSuccess(jsonResult)
                
            }
            
        })
        task.resume()
    }
}

        

