//
//  AddIngredientsViewController.swift
//  NutritionAnalysis
//
//  Created by huda elhady on 01/05/2021.
//

import UIKit

class AddIngredientsViewController: UIViewController {
    
    @IBOutlet weak var ingredientTextView: UITextView!
    @IBOutlet weak var ingredientsTableView: UITableView!
    @IBOutlet weak var analyzeButton: UIButton!
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    
    var viewModel: AddIngredientsViewModel!
    var ingredientsArr = [String]() {
        didSet {
            analyzeButton.isUserInteractionEnabled = true
            ingredientTextView.text = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = AddIngredientsViewModel()
        ingredientsTableView.estimatedRowHeight = 80
        ingredientsTableView.rowHeight = UITableView.automaticDimension
        let bar = UIToolbar()
        let done = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTapped))
        bar.items = [done]
        bar.sizeToFit()
        ingredientTextView.inputAccessoryView = bar
        initObservables()
    }
    
    func initObservables() {
            viewModel.isLoading.bindAndFire { (isLoading) in
                if isLoading { self.activityLoader.startSpinner()} else { self.activityLoader.stopSpinner()}
            }
        viewModel.recipeAnalysis.bind { [weak self](recipeAnalysis) in
            let totalArr = self?.viewModel.convertToDailyNutritionArray(from: recipeAnalysis)
            let vc = NutritionAnalysisViewController.create(analysis: totalArr ?? [])
            self?.navigationController?.pushViewController(vc, animated: true)
            }
            
            viewModel.errorMessage.bind { errorMessage in
                self.alert(message: errorMessage, actions: [("OK", .cancel)])
            }
        }

    
    @objc func doneTapped() {
        ingredientTextView.resignFirstResponder()
    }

    @IBAction func addIngredientButtonAction(_ sender: UIButton) {
        if !ingredientTextView.text.isEmpty {
            doneTapped()
            ingredientsArr.append(ingredientTextView.text)
            
            ingredientsTableView.reloadData()
        }
        
    }
    
    @IBAction func analyzeButtonAction(_ sender: UIButton) {
        viewModel.analyze(ingr: ingredientsArr)
    }
}

extension AddIngredientsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return ingredientsArr.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: IngredientTableCell.identifier, for: indexPath) as? IngredientTableCell {
                cell.configure(ingredient: ingredientsArr[indexPath.row])
                return cell
            }
            return UITableViewCell()
        }
}
