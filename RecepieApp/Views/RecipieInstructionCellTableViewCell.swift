//
//  RecipieInstructionCellTableViewCell.swift
//  RecepieApp
//
//  Created by Hitesh Suthar on 07/10/23.
//

import UIKit

class RecipieInstructionCellTableViewCell: UITableViewCell {
    
    static let identifier = "recipieInstructionCellTableViewCell"
    
    @IBOutlet weak var stepInstruction: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(stepInstruction: String?) {
        guard let step = stepInstruction else {
            debugPrint(PropertyError.emptyProperty.localizedDescription)
            return
        }
        DispatchQueue.main.async {
            self.stepInstruction.text = step
        }
    }
}
