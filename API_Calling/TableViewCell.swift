//
//  TableViewCell.swift
//  API_Calling
//
//  Created by R86 on 20/03/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lableForTitle: UILabel!
    @IBOutlet weak var lableForId: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
