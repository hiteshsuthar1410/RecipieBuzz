//
//  RecepieCell.swift
//  RecipieBuzz
//
//  Created by Hitesh Suthar on 23/09/23.
//

import UIKit

class RecepieCell: UITableViewCell {

    static let indetifier = "recepieCell"
    
    @IBOutlet weak var recepieImage: UIImageView!
    @IBOutlet weak var recepieType: UILabel!
    @IBOutlet weak var recepieName: UILabel!
    
    override func prepareForReuse() {
        recepieImage.image = UIImage(named: "recipieImagePlaceholder")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
