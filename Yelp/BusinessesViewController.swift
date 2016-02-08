//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, UISearchResultsUpdating{

    var businesses: [Business]!

    var searchController = UISearchController()
    var filteredRestaurants: [Business]!
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        filteredRestaurants = businesses
        
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchResultsUpdater = self
        
        self.searchController.searchBar.backgroundColor = UIColor.redColor()
        
        self.searchController.dimsBackgroundDuringPresentation = false
        self.searchController.searchBar.sizeToFit()
        
        self.tableView.tableHeaderView = self.searchController.searchBar
        
        
        tableView.tableHeaderView = searchController.searchBar
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
        automaticallyAdjustsScrollViewInsets = false
        definesPresentationContext = true
        
        Business.searchWithTerm("Thai", completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.filteredRestaurants = businesses
            self.tableView.reloadData()
            
            for business in self.filteredRestaurants {
                print(business.name!)
                print(business.address!)
            }
            
        })

/* Example of Yelp search with more search options specified
        Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            
            for business in businesses {
                print(business.name!)
                print(business.address!)
            }
        }
*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if filteredRestaurants != nil{
            return filteredRestaurants!.count
            
        }else{
            return 0
        }
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell") as! BusinessCell
        
        cell.business = filteredRestaurants[indexPath.row]
        return cell
        
    }
    
    
    func updateSearchResultsForSearchController(searchController: UISearchController){
        /*
        self.filteredRestaurants.removeAll(keepCapacity: false)
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (self.businesses as NSArray).filteredArrayUsingPredicate(searchPredicate)
        
        self.filteredRestaurants = array as! [Business]
        
        self.tableView.reloadData()
        */
        if let searchText = searchController.searchBar.text {
            filteredRestaurants = searchText.isEmpty ? businesses : businesses.filter({(dataString: Business) -> Bool in
                return dataString.name!.rangeOfString(searchText, options: .CaseInsensitiveSearch) != nil
            })
            
            tableView.reloadData()
        }
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
