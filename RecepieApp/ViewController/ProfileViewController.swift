//
//  ProfileViewController.swift
//  RecepieApp
//
//  Created by Hitesh Suthar on 06/12/23.
//

import UIKit

class ProfileViewController: UITableViewController {
    
    let settingsMenu = ["", "Saved", "Help and feedback", "Logout"]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        navigationController?.navigationBar.prefersLargeTitles = true

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return settingsMenu.count
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        } else {
            return tableView.rowHeight
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileImageViewTableViewCell.identifier, for: indexPath) as? ProfileImageViewTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: UIImage(named: "samplePersonImage"))
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileOverviewCell.identifier, for: indexPath) as? ProfileOverviewCell else {
                debugPrint(CastingError.itemORCellCasting)
                return UITableViewCell()
            }
            cell.configure(name: "John Doe", emailAddress: "johndoe@email.com")
            return cell
        
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.identifier, for: indexPath) as? ProfileCell else {
                debugPrint(CastingError.itemORCellCasting)
                return UITableViewCell()
            }
            cell.configure(cellTitle: settingsMenu[indexPath.row])
            return cell
            
        }
        
//        if (indexPath.row == 0) {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileOverviewCell.identifier, for: indexPath) as? ProfileOverviewCell else {
//                debugPrint(CastingError.itemORCellCasting)
//                return UITableViewCell()
//            }
//            cell.configure(name: "Hitesh", emailAddress: "hiteshsuthar1410@gmail.com")
//            return cell
//        } else {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.identifier, for: indexPath) as? ProfileCell else {
//                debugPrint(CastingError.itemORCellCasting)
//                return UITableViewCell()
//            }
//            cell.configure(cellTitle: settingsMenu[indexPath.row])
//            return cell
//        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
