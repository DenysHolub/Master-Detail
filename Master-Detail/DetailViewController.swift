//
//  DetailViewController.swift
//  Master-Detail
//
//  Created by Denys on 9/1/16.
//  Copyright © 2016 Denys Holub. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet weak var productImageView: UIImageView!
  @IBOutlet weak var tableView: UITableView!
  
  var product: Master!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
      self.productImageView.image = UIImage(named: product.image)
      self.tableView.backgroundColor = UIColor(red: 250 / 255, green: 212 / 255, blue: 255 / 255, alpha: 1.0)
      self.tableView.tableFooterView = UIView(frame: CGRectZero)
      self.tableView.separatorColor = UIColor(red: 252 / 255, green: 232 / 255, blue: 255 / 255, alpha: 1.0)
      
      self.tableView.estimatedRowHeight = 44
      self.tableView.rowHeight = UITableViewAutomaticDimension
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return 4
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! DetailTableViewCell
    
    //отображение информации в ячейках
    
    //    if indexPath.row == 0 {
    //      cell.keyLabel.text = "Название"
    //      cell.valueLabel.text = product.title
    //    }
    //    if indexPath.row == 1 {
    //      cell.keyLabel.text = "Тип"
    //      cell.valueLabel.text = product.subtitle
    //    }
    
    switch indexPath.row {
    case 0:
      cell.keyLabel.text = "Название"
      cell.valueLabel.text = product.title
    case 1:
      cell.keyLabel.text = "Тип"
      cell.valueLabel.text = product.subtitle
    default:
      cell.keyLabel.text = ""
      cell.valueLabel.text = ""
    }
    
    cell.backgroundColor = UIColor.clearColor()
    
    return cell
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
