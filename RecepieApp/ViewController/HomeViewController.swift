//
//  HomeViewController.swift
//  RecepieApp
//
//  Created by Hitesh Suthar on 23/09/23.
//

import AlamofireImage
import UIKit

class HomeViewController: UIViewController {
    
    var recepies = [Recipe]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lets go Chef!"
        tableView.delegate = self
        tableView.dataSource = self
        
        getRecipies()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let recepieVC = segue.destination as? RecepieViewController else {
            print("Destination vc is not of type RecepieVC")
            return
        }
        if let indexPath = tableView.indexPathForSelectedRow {
            recepieVC.configure(recepies[indexPath.row].id)
        }
    }
    
    private func getRecipies() {
        Network.shared.getRandomRecepies { [weak self] result in
            switch result {
            case .success(let recepies):
                DispatchQueue.main.async {
                    self?.recepies = recepies.recipes
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecepieCell.indetifier, for: indexPath) as? RecepieCell else {
            print("Cell can not convert to RecepieCell")
            return UITableViewCell()
        }
        let recipie = self.recepies[indexPath.row]
        cell.recepieName.text = recipie.title
        if let url = URL(string: recipie.image ?? "") {
            cell.recepieImage.af.setImage(withURL: url)
        } else {
            print(URLError.invalidURL)
        }
        if let dishTypes = recipie.dishTypes  {
            cell.recepieType.text = dishTypes.first?.capitalized
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recepies.count
    }
}

