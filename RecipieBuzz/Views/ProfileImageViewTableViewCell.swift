//
//  ProfileImageViewTableViewCell.swift
//  RecipieBuzz
//
//  Created by Hitesh Suthar on 14/01/24.
//

import UIKit

class ProfileImageViewTableViewCell: UITableViewCell {

    @IBOutlet weak private var profileImageView: UIImageView!
    
    static let identifier = "profileImageViewTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configure(with image: UIImage?) {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor),
            profileImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
        if let image = image {
            DispatchQueue.main.async {
                self.profileImageView.image = image
                self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.height / 2
                self.profileImageView.clipsToBounds = true
                self.imageView?.contentMode = .scaleToFill
            }
        }
    }
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
