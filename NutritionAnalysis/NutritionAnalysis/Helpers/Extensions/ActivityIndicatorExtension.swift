//
//  ActivityIndicatorExtension.swift
//  NutritionAnalysis
//
//  Created by huda elhady on 03/05/2021.
//

import UIKit

extension UIActivityIndicatorView {
    func startSpinner() {
        startAnimating()
        isHidden = false
        isUserInteractionEnabled = false
    }

    func stopSpinner() {
        stopAnimating()
        isHidden = true
        isUserInteractionEnabled = true
    }
}
