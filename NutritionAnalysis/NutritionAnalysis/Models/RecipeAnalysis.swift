//
//  RecipeAnalysis.swift
//  NutritionAnalysis
//
//  Created by huda elhady on 02/05/2021.
//

import Foundation

struct RecipeAnalysis : Codable {

    var calories : Int?
    var cautions : [String]?
    var dietLabels : [String]?
    var healthLabels : [String]?
    var totalDaily : TotalDaily?
    var totalNutrients : TotalNutrient?
    var totalNutrientsKCal : TotalNutrientsKCal?
    var totalWeight : Float?
    var uri : String?
    var yield : Float?


    enum CodingKeys: String, CodingKey {
        case calories = "calories"
        case cautions = "cautions"
        case dietLabels = "dietLabels"
        case healthLabels = "healthLabels"
        case totalDaily
        case totalNutrients
        case totalNutrientsKCal
        case totalWeight = "totalWeight"
        case uri = "uri"
        case yield = "yield"
    }

}

struct TotalNutrientsKCal : Codable {

    let cHOCDFKCAL : CHOCDFKCAL?
    let eNERCKCAL : CHOCDFKCAL?
    let fATKCAL : CHOCDFKCAL?
    let pROCNTKCAL : CHOCDFKCAL?


    enum CodingKeys: String, CodingKey {
        case cHOCDFKCAL
        case eNERCKCAL
        case fATKCAL
        case pROCNTKCAL
    }

}

struct CHOCDFKCAL : Codable {

    let label : String?
    let quantity : Int?
    let unit : String?

    enum CodingKeys: String, CodingKey {
        case label = "label"
        case quantity = "quantity"
        case unit = "unit"
    }
}

struct TotalNutrient : Codable {

    let cA : CA?
    let cHOCDF : CA?
    let cHOLE : CA?
    let eNERCKCAL : CA?
    let fAMS : CA?
    let fAPU : CA?
    let fASAT : CA?
    let fAT : CA?
    let fATRN : CA?
    let fE : CA?
    let fIBTG : CA?
    let fOLAC : CA?
    let fOLDFE : CA?
    let fOLFD : CA?
    let k : CA?
    let mG : CA?
    let nA : CA?
    let nIA : CA?
    let p : CA?
    let pROCNT : CA?
    let rIBF : CA?
    let sUGAR : CA?
    let tHIA : CA?
    let tOCPHA : CA?
    let vITARAE : CA?
    let vITB12 : CA?
    let vITB6A : CA?
    let vITC : CA?
    let vITD : CA?
    let vITK1 : CA?
    let wATER : CA?
    let zN : CA?


    enum CodingKeys: String, CodingKey {
        case cA
        case cHOCDF
        case cHOLE
        case eNERCKCAL
        case fAMS
        case fAPU
        case fASAT
        case fAT
        case fATRN
        case fE
        case fIBTG
        case fOLAC
        case fOLDFE
        case fOLFD
        case k
        case mG
        case nA
        case nIA
        case p
        case pROCNT
        case rIBF
        case sUGAR
        case tHIA
        case tOCPHA
        case vITARAE
        case vITB12
        case vITB6A
        case vITC
        case vITD
        case vITK1
        case wATER
        case zN
    }
}

struct TotalDaily : Codable {

    var cA : CA?
    var cHOCDF : CA?
    var cHOLE : CA?
    var eNERCKCAL : CA?
    var fASAT : CA?
    var fAT : CA?
    var fE : CA?
    var fIBTG : CA?
    var fOLDFE : CA?
    var k : CA?
    var mG : CA?
    var nA : CA?
    var nIA : CA?
    var p : CA?
    var pROCNT : CA?
    var rIBF : CA?
    var tHIA : CA?
    var tOCPHA : CA?
    var vITARAE : CA?
    var vITB12 : CA?
    var vITB6A : CA?
    var vITC : CA?
    var vITD : CA?
    var vITK1 : CA?
    var zN : CA?


    enum CodingKeys: String, CodingKey {
        case cA = "CA"
        case cHOCDF = "CHOCDF"
        case cHOLE = "CHOLE"
        case eNERCKCAL = "ENERC_KCAL"
        case fASAT = "FASAT"
        case fAT = "FAT"
        case fE = "FE"
        case fIBTG = "FIBTG"
        case fOLDFE = "FOLDFE"
        case k = "K"
        case mG = "MG"
        case nA = "NA"
        case nIA = "NIA"
        case p = "P"
        case pROCNT = "PROCNT"
        case rIBF = "RIBF"
        case tHIA = "THIA"
        case tOCPHA
        case vITARAE = "VITA_RAE"
        case vITB12 = "VITB12"
        case vITB6A = "VITB6A"
        case vITC = "VITC"
        case vITD = "VITD"
        case vITK1
        case zN = "ZN"
    }

}

struct CA : Codable {
    
    let label : String?
    let quantity : Float?
    let unit : String?
    
    
    enum CodingKeys: String, CodingKey {
        case label = "label"
        case quantity = "quantity"
        case unit = "unit"
    }
}

