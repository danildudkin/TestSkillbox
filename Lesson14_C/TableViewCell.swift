//
//  TableViewCell.swift
//  Lesson14_C
//
//  Created by Danila Dudkin on 04.02.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var dealsLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
