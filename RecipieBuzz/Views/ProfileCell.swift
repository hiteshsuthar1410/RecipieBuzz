//
//  ProfileCell.swift
//  RecipieBuzz
//
//  Created by Hitesh Suthar on 06/12/23.
//

import UIKit

class ProfileCell: UITableViewCell {

    static let identifier = "profileCellIdentifier"
    @IBOutlet weak var cellTitle: UILabel!
    func configure(cellTitle: String) {
        self.cellTitle.text = cellTitle
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
