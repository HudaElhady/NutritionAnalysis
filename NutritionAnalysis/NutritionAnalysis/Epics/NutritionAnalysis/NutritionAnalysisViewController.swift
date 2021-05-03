//
//  NutritionAnalysisViewController.swift
//  NutritionAnalysis
//
//  Created by huda elhady on 03/05/2021.
//

import UIKit

class NutritionAnalysisViewController: UIViewController {
    @IBOutlet weak var analysisTableView: UITableView!
//    @IBOutlet weak var authorLabel: UILabel!
    
    private var recipeAnalysisArr = [CA]()
//    private let isbnSegue = "isbnSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    static func create(analysis: [CA]) -> NutritionAnalysisViewController {
        if let vc = UIStoryboard(name: StoryBoardsIDs.main.id, bundle: nil).instantiateViewController(withIdentifier: ViewControllersIDs.NutritionAnalysisVC.id) as? NutritionAnalysisViewController {
            vc.recipeAnalysisArr = analysis
            return vc
        }
        return NutritionAnalysisViewController()
    }
    
}

extension NutritionAnalysisViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return recipeAnalysisArr.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: NutritionAnalysisTableCell.identifier, for: indexPath) as? NutritionAnalysisTableCell {
                cell.configure(details: recipeAnalysisArr[indexPath.row])
                return cell
            }
            return UITableViewCell()
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

//        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            navigationController?.pushViewController(DocumentDetailsViewController.create(document: documentslist[indexPath.row])!, animated: true)
//        }
}
