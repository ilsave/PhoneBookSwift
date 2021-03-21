//
//  CustomTableViewCell.swift
//  PhoneBook
//
//  Created by Gushchin Ilya on 21.03.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet var labelLeading: UILabel!
    @IBOutlet var labelTrailing: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
