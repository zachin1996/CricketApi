//
//  HomeViewController.swift
//  weather
//
//  Created by Sachin on 30/05/19.
//  Copyright © 2019 Sachin. All rights reserved.
//

import UIKit

struct Constants {
    struct preferacne {
        static let logout = "userdetails"
    }
   
}

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var dataSource: [[String:Any]] = []
    
    @IBOutlet weak var matchTable: UITableView!
    var selectedSegmentIndex: Int = 0
    
    
    
    
    @IBAction func segmentControlButton(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            selectedSegmentIndex = 0
            getData(url: url1)
            }
        else {
            selectedSegmentIndex = 1

            getData(url: url2)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 328
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewC", for: indexPath) as! MatchTableViewCell
        let singleItem = dataSource[indexPath.row]
        if self.selectedSegmentIndex == 0{
        cell.dateLabel.text = singleItem["date"] as? String
        cell.t1Label.text = singleItem["team-1"] as? String
        cell.t2Label.text = singleItem["team-2"] as? String
        }
        else {
        cell.dateLabel.text = singleItem["description"] as? String
        cell.t1Label.text = singleItem["title"] as? String
        cell.t2Label.text = singleItem["unique_id"] as? String
        }
        return cell
    }
    
    let url1 = "matches"
    let url2 = "cricket"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData(url: url1)
    }
    
    func getData(url:String) {
        APIManager.sharedInstance.getPostid(urlToPost: url, OnSuccess: { (response) in
            
            if self.selectedSegmentIndex == 0{
                
            let matches = response["matches"] as! [[String:Any]]
            self.dataSource = matches
            }
            //print("Matches", matches,self.dataSource.count)
            else {
                let data = response["data"] as! [[String:Any]]
                self.dataSource = data
            }
            DispatchQueue.main.async {
                self.matchTable.reloadData()
        }
        }, onFailure: { (error) in
            print("Error:",error)
        })
    }
    
    @IBAction func signOutTapped(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: Constants.preferacne.logout)
        performSegue(withIdentifier: "toLogin", sender: nil)
        let value = UserDefaults.standard.value(forKey: Constants.preferacne.logout)
        
        print("logoutttt",value.debugDescription)

        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
