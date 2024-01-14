//
//  ProfileOverviewCell.swift
//  RecipieBuzz
//
//  Created by Hitesh Suthar on 06/12/23.
//

import UIKit

class ProfileOverviewCell: UITableViewCell {

    static let identifier = "profileOverViewCellIdentifier"
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var email: UILabel!
    
    func configure(name: String, emailAddress: String) {
        DispatchQueue.main.async {
            //
//            self.userImage.layer.cornerRadius = self.userImage.frame.size.width / 2
////            self.userImage.clipsToBounds = true
//            self.userImage.layer.borderColor = UIColor.blue.cgColor
//            self.userImage.layer.borderWidth = 5
            self.userName.text = name
            self.email.text = emailAddress
        }
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
