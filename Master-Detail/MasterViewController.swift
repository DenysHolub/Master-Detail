//
//  MasterViewController.swift
//  Master-Detail
//
//  Created by Denys on 9/1/16.
//  Copyright © 2016 Denys Holub. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController, UISearchResultsUpdating {
  
  var searchController: UISearchController!
  var searchResultsArray: [Master] = []
  
  var product: [Master] = [
    Master(title: "Ogonёk Grill&Bar", subtitle: "ресторан", image: "ogonek.jpg"),
    Master(title: "Елу", subtitle: "ресторан", image: "elu.jpg"),
    Master(title: "Bonsai", subtitle: "ресторан", image: "bonsai.jpg"),
    Master(title: "Дастархан", subtitle: "ресторан", image: "dastarhan.jpg"),
    Master(title: "Индокитай", subtitle: "ресторан", image: "indokitay.jpg"),
    Master(title: "X.O", subtitle: "ресторан-клуб", image: "x.o.jpg"),
    Master(title: "Балкан Гриль", subtitle: "ресторан", image: "balkan.jpg"),
    Master(title: "Respublica", subtitle: "ресторан", image: "respublika.jpg"),
    Master(title: "Speak Easy", subtitle: "ресторанный комплекс", image: "speakeasy.jpg"),
    Master(title: "Morris Pub", subtitle: "ресторан", image: "morris.jpg"),
    Master(title: "Вкусные истории", subtitle: "ресторан", image: "istorii.jpg"),
    Master(title: "Классик", subtitle: "ресторан", image: "klassik.jpg"),
    Master(title: "Love&Life", subtitle: "ресторан", image: "love.jpg"),
    Master(title: "Шок", subtitle: "ресторан", image: "shok.jpg"),
    Master(title: "Бочка", subtitle: "ресторан", image: "bochka.jpg")]
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
      self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
      
      searchController = UISearchController(searchResultsController: nil)
      searchController.searchBar.sizeToFit()
      tableView.tableHeaderView = searchController.searchBar
      
      definesPresentationContext = true
      
      searchController.searchResultsUpdater = self
      searchController.dimsBackgroundDuringPresentation = false
      
      searchController.searchBar.tintColor = UIColor.whiteColor()
    }
  
  func filterContentFor(searchText: String) {
    searchResultsArray = product.filter({ (products: Master) -> Bool in
      let machedName = products.title.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil, locale: nil)
      
      return machedName != nil
    })
  }
  
  func updateSearchResultsForSearchController(searchController: UISearchController) {
    
    let searchText = searchController.searchBar.text
    filterContentFor(searchText!)
    
    tableView.reloadData()
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      if searchController.active {
        return searchResultsArray.count
      } else {
        return product.count
      }
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
      let cellIdentifier = "Cell"
      
      let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MasterTableViewCell
      
      // Configure the cell...
      
      let products = (searchController.active) ? searchResultsArray[indexPath.row] : product[indexPath.row]
      cell.thumbnailImageView.image = UIImage(named: product[indexPath.row].image)
      
      cell.titleLabel.text = products.title
      cell.subtitleLabel.text = products.subtitle
      cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.height / 2
      cell.thumbnailImageView.clipsToBounds = true
      
      return cell
  }
  
  
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
      if searchController.active {
        return false
      } else {
        return true
      }
    }
  

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      if segue.identifier == "showDetailsSegue" {
        if let indexPath = self.tableView.indexPathForSelectedRow {
          let detinationVC = segue.destinationViewController as! DetailViewController
          detinationVC.product = (searchController.active) ? searchResultsArray[indexPath.row] : product[indexPath.row]
        }
      }

      
      
    }
  

}
