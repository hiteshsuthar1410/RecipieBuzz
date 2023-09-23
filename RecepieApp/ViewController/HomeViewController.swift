//
//  HomeViewController.swift
//  RecepieApp
//
//  Created by Hitesh Suthar on 23/09/23.
//

import UIKit

class HomeViewController: UIViewController, UITabBarDelegate, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Lets go Chef!"
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecepieCell.indetifier, for: indexPath) as? RecepieCell else {
            print("Cell can not converted to RecepieCell")
            return UITableViewCell()
        }
        print("Here")
        cell.recepieImage.image = UIImage(named: "recepiePlaceholderImage")
        cell.recepieName.text = "Tasty Recepie"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
}

