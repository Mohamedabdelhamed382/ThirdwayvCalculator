//
//  operandCollectionViewCell.swift
//  ThirdwayvCalculator
//
//  Created by MOHAMED ABD ELHAMED AHMED on 20/01/2022.
//

import UIKit

class OperandCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var numbersLabel: PaddingLabel!
    static let identifier = String( describing:  OperandCollectionViewCell.self)

    override func awakeFromNib() {
        super.awakeFromNib()
        numbersLabel.layer.borderColor = UIColor.white.cgColor
        numbersLabel.layer.borderWidth = 5.0
        
    }
    

    
}
