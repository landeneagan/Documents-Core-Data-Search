//
//  DocumentTableViewCell.swift
//  Document-Core-DataUITests
//
//  Created by Landen Eagan on 7/13/18.
//  Copyright © 2018 Landen Eagan. All rights reserved.
//

import UIKit

class DocumentTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
