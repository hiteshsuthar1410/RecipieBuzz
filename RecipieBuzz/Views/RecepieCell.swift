//
//  RecipieCell.swift
//  RecipieBuzz
//
//  Created by Hitesh Suthar on 23/09/23.
//

import UIKit

class RecipieCell: UITableViewCell {

    static let indetifier = "recipieCell"
    
    @IBOutlet weak var recipieImage: UIImageView!
    @IBOutlet weak var recipieType: UILabel!
    @IBOutlet weak var recipieName: UILabel!
    
    override func prepareForReuse() {
        recipieImage.image = UIImage(named: "recipieImagePlaceholder")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
