//
//  FiltersViewController.swift
//  Yelp
//
//  Created by Héctor Rábago on 2/7/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

protocol FiltersViewControllerDelegate{
    //func filtersViewController(filter)
}

class FiltersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SwitchCellDelegate  {

    @IBOutlet weak var tableView: UITableView!
    
    var categories: [[String:String]]!
    var switchStates = [Int:Bool]()
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        categories = yelpCategories()
        tableView.delegate = self
        tableView.dataSource = self 
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
        
    @IBAction func onCancelButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func onSearchButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return categories.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("SwitchCell" , forIndexPath: indexPath) as! SwitchCell
        
        cell.switchCell.text = categories[indexPath.row ]["name"]
        
        cell.delegate = self
        
        
        
        cell.onSwitch.on = switchStates[indexPath.row] ?? false
            
        
        return cell
        
        
    }
    func switchCell(switchCell: SwitchCell, didChangeValue value: Bool) {
        
        let indexPath = tableView.indexPathForCell(switchCell)!
        
        switchStates[indexPath.row] = value
        
        print("filters view controller got the switch event")
    }
    
    func yelpCategories() -> [[String:String]] {
        return [["name":"Afghan", "code":"afghani"],
            ["name":"African", "code":"african"],
            ["name":"American, New", "code":"newamerican"],
            ["name":"Arabian", "code":"arabian"],
            ["name":"Argentine", "code":"argentine"],
            ["name":"Asian Fusion", "code":"asianfusion"],
            ["name":"Asturian", "code":"asturian"],
           
        ]
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
