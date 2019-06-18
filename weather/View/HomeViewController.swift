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
    
    @IBOutlet weak var emptyData: UILabel!
    var source1: Play?
    var source2: Prev?
    
    
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
    
    func noData(){
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if selectedSegmentIndex == 0 {
            return source1 == nil ? 0 : (source1?.matches.count)!
        }else {
            return source2 == nil ? 0 : (source2?.data.count)!
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 328
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewC", for: indexPath) as! MatchTableViewCell
        
        if self.selectedSegmentIndex == 0{
        let single = source1?.matches[indexPath.row]
            
        cell.dateLabel.text = single?.date
        cell.t1Label.text = single?.team_1
        cell.t2Label.text = single?.team_2
        }
        else {
            let singlet = source2?.data[indexPath.row]
        cell.dateLabel.text = singlet?.description
        cell.t1Label.text = singlet?.title
        cell.t2Label.text = singlet?.unique_id
        }
        
//        cell.viewHomeShadow.dropShadow()
        
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
                
                
                let matches = response.ma
                
                self.source1 = matches
                
                
                print(matches as Any)
//                let matches = response["matches"] as! [[String:Any]]
//                self.dataSource = matches
            }
            //print("Matches", matches,self.dataSource.count)
            else {
//                let data = response["data"] as! [[String:Any]]
//                self.dataSource = data
                let data = response.da
                
                self.source2 = data
                
                print(data as Any)
            }
            
            
          
            DispatchQueue.main.async  {
                
                if self.selectedSegmentIndex == 0{
                    if self.source1?.matches.count == 0{
                        self.matchTable.separatorStyle = .none
                        self.emptyData.isHidden = false
                        
                        
//                        self.matchTable.reloadData()
                    }
                    else {
                        self.emptyData.isHidden = true
                        self.matchTable.separatorStyle = .none
                        self.matchTable.reloadData()
                 
                    }
                }
                else if self.selectedSegmentIndex == 1{
                    if self.source2?.data.count == 0{
                        self.emptyData.isHidden = false
                        self.matchTable.separatorStyle = .none

                    }
                    else {
                        
                        self.emptyData.isHidden = true

                        self.matchTable.reloadData()
                    }
                }
                
              //  self.matchTable.reloadData()
        }
        }, onFailure: { (error) in
            print("Error:",error)
        })
    }
    
    @IBAction func signOutTapped(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: Constants.preferacne.logout)
        performSegue(withIdentifier: "toLogin", sender: nil)
        let value = UserDefaults.standard.value(forKey: Constants.preferacne.logout)
        
        print("logoutttt", value.debugDescription)

        
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
