//
//  RecepieViewController.swift
//  RecipieBuzz
//
//  Created by Hitesh Suthar on 25/09/23.
//

import UIKit

class RecepieViewController: UIViewController {

    static let identifier = "RecipieViewController"
    
    private var recipieID: Int?
    @IBOutlet weak var recipieImage: UIImageView!
    @IBOutlet weak var recipieName: UILabel!
    @IBOutlet weak var recipieDescription: UILabel!
    @IBOutlet weak var ingridients: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        getRecipieInfo()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let instructionVC = segue.destination as? ReceipieInstructionViewController else {
            debugPrint(CastingError.viewControllerCasting.localizedDescription)
            return
        }
        Network.shared.getRecipieInstructions(ofrecipieID: recipieID!) { result in
            switch result {
            case .success(let receivedResponse):
                DispatchQueue.main.async {
                    instructionVC.configure(recipieInstruction: receivedResponse)
                }
            case .failure(let errror):
                debugPrint(errror)
            }
        }
        
    }
    
    func configure(_ recipieID: Int) {
        self.recipieID = recipieID
    }
    
    func formatRecipeSummary(htmlsummary: String?) -> String? {
        var summary = htmlsummary?.htmlToString()
        summary = summary?.replacingOccurrences(of: ". ", with: ". \n")
        return summary
    }
    
    func formatRecipieIngrideents(extendedIngredients: [ExtendedIngredient]?) -> String? {
        if let ingridients = extendedIngredients  {
            let instructions = ingridients.map { ingridient in
                return ingridient.original?.appending("\n") ?? "N/A"
            }
            let combinedString = instructions.reduce("") { (result, string) in
                return result + string
            }
            return combinedString
        } else {
            return nil
        }
    }
    func getRecipieInfo() {
        guard let recipeID = recipieID else {
            print("Empty Id")
            return
        }
        Network.shared.getRecipieInformation(for: recipeID) { result in
            switch result {
            case .success(let recepie):
                let summary = self.formatRecipeSummary(htmlsummary: recepie.summary)
                let ingredients = self.formatRecipieIngrideents(extendedIngredients: recepie.extendedIngredients)
                DispatchQueue.main.async {
                    self.recipieName.text = recepie.title
                    self.recipieDescription.text = summary
                    self.ingridients.text = ingredients
                }
                if let url = URL(string: recepie.image ?? "") {
                    self.recipieImage.af.setImage(withURL: url)
                } else {
                    print(URLError.invalidURL)
                }
            case .failure(let error):
                print(error)
            }
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
