//
//  MasterTableViewCell.swift
//  Master-Detail
//
//  Created by Denys on 9/1/16.
//  Copyright © 2016 Denys Holub. All rights reserved.
//

import UIKit

class MasterTableViewCell: UITableViewCell {
  
  
  @IBOutlet weak var thumbnailImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subtitleLabel: UILabel!
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
