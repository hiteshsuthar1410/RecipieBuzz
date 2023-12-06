//
//  ProfileOverviewCell.swift
//  RecepieApp
//
//  Created by Hitesh Suthar on 06/12/23.
//

import UIKit

class ProfileOverviewCell: UITableViewCell {

    static let identifier = "profileOverViewCellIdentifier"
     
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    
    
    func configure() {
        userImage.clipsToBounds = true
        userImage.layer.cornerRadius = userImage.frame.size.width/2
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
