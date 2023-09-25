//
//  HomeViewController.swift
//  RecepieApp
//
//  Created by Hitesh Suthar on 23/09/23.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//       Get the new view controller.
//       if let imageVC = segue.destination as? ImageViewController {
//          let image = getImageForSelectedRow()
//          imageVC.currentImage = image
//       }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Lets go Chef!"
        tableView.delegate = self
        tableView.dataSource = self
        
        Network.shared.getRandomRecepies { result in
            switch result {
            case .success(let recepies):
                print(recepies.recipes.count, recepies)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecepieCell.indetifier, for: indexPath) as? RecepieCell else {
            print("Cell can not converted to RecepieCell")
            return UITableViewCell()
        }
        cell.recepieImage.image = UIImage(named: "recepiePlaceholderImage")
        cell.recepieName.text = "Tasty Recepie"
        cell.recepieType.text = "Dinner"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
}

