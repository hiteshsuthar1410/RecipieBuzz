//
//  ReceipieInstructionViewController.swift
//  RecepieApp
//
//  Created by Hitesh Suthar on 07/10/23.
//

import UIKit

class ReceipieInstructionViewController: UIViewController {
    
    
    var recipieInstruction: [RecipieInstruction]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    
    func configure(recipieInstruction: [RecipieInstruction]) {
        DispatchQueue.main.async {
            self.recipieInstruction = recipieInstruction
            self.tableView.reloadData()
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ReceipieInstructionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecipieInstructionCellTableViewCell.identifier, for: indexPath) as? RecipieInstructionCellTableViewCell else {
            debugPrint(CastingError.itemORCellCasting.localizedDescription)
            return UITableViewCell()
        }
        cell.configure(stepInstruction: recipieInstruction?.first?.steps?[indexPath.section].step)
        return cell
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let numberOfSections = recipieInstruction?[0].steps?.count else {
            debugPrint(PropertyError.emptyProperty)
            return 1
        }
        return numberOfSections
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let stepNumber = recipieInstruction?[0].steps?[section].number else {
            debugPrint(PropertyError.emptyProperty)
            return "N/A"
        }
        return "Step \(stepNumber)"
    }
}
