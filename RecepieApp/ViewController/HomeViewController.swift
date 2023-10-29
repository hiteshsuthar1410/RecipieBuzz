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
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Recipies"
        tableView.delegate = self
        tableView.dataSource = self
        
        activityIndicator.startAnimating()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
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
        Network.shared.fetching = true
        Network.shared.getRandomRecepies { [weak self] result in
            switch result {
            case .success(let recepies):
                DispatchQueue.main.async {
                    self?.recepies.append(contentsOf: recepies.recipes)
                    Network.shared.pageOffset += 1
                    self?.tableView.reloadData()
                    Network.shared.fetching = false
                }
            case .failure(let error):
                print(error)
                self?.activityIndicator?.stopAnimating()
                self?.activityIndicator?.isHidden = true
            }
        }
    }
    
}
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecepieCell.indetifier, for: indexPath) as? RecepieCell else {
            print("Cell could not be converted to RecepieCell")
            return UITableViewCell()
        }
        let recipie = self.recepies[indexPath.row]
        cell.recepieName.text = recipie.title
        if let url = URL(string: recipie.image ?? "") {
            DispatchQueue.main.async {
                cell.recepieImage.af.setImage(withURL: url)
            }
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

extension HomeViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        ///Reference :- https://www.youtube.com/watch?v=OTHkcf9gSRw
        
        let offsetY = scrollView.contentOffset.y // Distance between top of scrollView and Top of contentView
        let contentHeight = scrollView.contentSize.height // Complete height of the scrollview (increases as the more content is added)
        let visibleScrollViewHeight = scrollView.frame.size.height // Height of the scrollView visible on screen (fixed)
        if offsetY > contentHeight - visibleScrollViewHeight - 100 {
            guard !Network.shared.fetching else {
                return
            }
            print("Load more")
            getRecipies()
        }
        
    }
}
