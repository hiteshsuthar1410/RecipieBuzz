//
//  RecepieCell.swift
//  RecepieApp
//
//  Created by Hitesh Suthar on 23/09/23.
//

import UIKit

class RecepieCell: UITableViewCell {

    static let indetifier = "recepieCell"
    
    @IBOutlet weak var recepieImage: UIImageView!
    @IBOutlet weak var recepieType: UILabel!
    @IBOutlet weak var recepieName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError()
//    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
