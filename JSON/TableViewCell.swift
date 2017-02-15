//
//  TableViewCell.swift
//  JSON
//
//  Created by Henry Aguinaga on 2016-11-10.
//  Copyright © 2016 Henry Aguinaga. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var actorPicture: UIImageView!
    @IBOutlet weak var actorName: UILabel!
    @IBOutlet weak var actorCountry: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
