//
//  NewProjectViewController.swift
//  ProjectTeams
//
//  Created by Jacob Bee Ho Brown on 12/2/18.
//  Copyright © 2018 CS 1998. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NewProjectTeamViewController: UIViewController {
    
    
    
    @IBOutlet var tblJSON: UITableView!
    var arrRes = [[String:AnyObject]]() //Array of dictionary
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://35.185.52.186/api/team/CU%20Air/socials/").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["instagram"].arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
                }
                if self.arrRes.count > 0 {
                    self.tblJSON.reloadData()
                }
            }
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "jsonCell")!
        var dict = arrRes[indexPath.row]
        cell.textLabel?.text = dict["instagram"] as? String
        cell.detailTextLabel?.text = dict["email"] as? String
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRes.count
    }
}
