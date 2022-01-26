//
//  MathCalculatorViewController.swift
//  ThirdwayvCalculator
//
//  Created by MOHAMED ABD ELHAMED AHMED on 19/01/2022.
//

import UIKit

class MathCalculatorViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var numbersTextFeild: UITextField!
    @IBOutlet weak var undoOutletButton: UIButton!
    @IBOutlet weak var redoOutletButton: UIButton!
    @IBOutlet weak var additionOutletButton: UIButton!
    @IBOutlet weak var subtractOutletButton: UIButton!
    @IBOutlet weak var multiplicationOutletButton: UIButton!
    @IBOutlet weak var divisionOutletButton: UIButton!
    @IBOutlet weak var equalOutletButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var numberOfItem: Int = 0
    lazy var buttons: [UIButton] = [self.additionOutletButton, self.subtractOutletButton,self.multiplicationOutletButton,self.divisionOutletButton]
    var isOperationSelect = false
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @IBAction func textFieldDidUpdated(_ sender: UITextField) {
        
            
        
    }
    
    
}

extension MathCalculatorViewController{
    
    private func setup(){
        initializeCollectionview()
        registerCategoryCell()
        stateOfRedoUndoButton(isEnabled: (collectionView.numberOfItems(inSection: 0) != 0 ? true:false))
        setupCollectionViewLayout()
        equalOutletButton.isEnabled = false
        numbersTextFeild.delegate = self
    }
    
    
    
    private func initializeCollectionview(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func registerCategoryCell(){
        collectionView.register(UINib(nibName: OperandCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier:
                                    OperandCollectionViewCell.identifier)
    }
    
    private func stateOfRedoUndoButton(isEnabled: Bool){
        undoOutletButton.isEnabled = isEnabled
        redoOutletButton.isEnabled = isEnabled
    }
    
    private func stateOfequalOutletButton(textFelidState: String?){
        for button in self.buttons {
            if button.isEnabled == false && textFelidState != ""{
                equalOutletButton.isEnabled = true
            }
        }
    }
    
    
    private func increaseNumberItemIncollection() {
        numberOfItem += 1
        stateOfRedoUndoButton(isEnabled: ( numberOfItem != 0 ? true:false))
        collectionView.reloadData()
        print(numberOfItem)
    }
    
    private func decreaseNumberItemIncollection() {
        if numberOfItem > 0 { numberOfItem -= 1 }
        stateOfRedoUndoButton(isEnabled: (numberOfItem != 0 ? true:false))
        collectionView.reloadData()
        print(numberOfItem)
    }
    
    private func disableAllButtonByClickOne(excludedButton: UIButton){
        for button in self.buttons {
            if button == excludedButton{
                button.isEnabled = true
            } else {
                button.isEnabled = false
                isOperationSelect = true
            }
        }
    }
    
    private func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 24
        layout.minimumInteritemSpacing = 24
        layout.sectionInset = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = CGSize(width: 50, height: 50)
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
}

extension MathCalculatorViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItem
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OperandCollectionViewCell.identifier, for: indexPath)as! OperandCollectionViewCell
        cell.numbersLabel.text = String(indexPath.row * 100)
        return cell
    }
}

extension MathCalculatorViewController:UITextFieldDelegate{
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        stateOfequalOutletButton(textFelidState: textField.text!)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let isNumber = CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: string))
        let withDecimal = (
            string == NumberFormatter().decimalSeparator &&
                textField.text?.contains(string) == false
        )
        return isNumber || withDecimal
    }
}


extension MathCalculatorViewController{
    @IBAction func undoActionButton(_ sender: Any) {
    }
    
    @IBAction func redoActionButton(_ sender: Any) {
    }
    
    @IBAction func additionActionButton(_ sender: UIButton) {
        increaseNumberItemIncollection()
        disableAllButtonByClickOne(excludedButton: sender.self)
    }
    
    @IBAction func subtractActionButton(_ sender: UIButton) {
        decreaseNumberItemIncollection()
        disableAllButtonByClickOne(excludedButton: sender.self)
    }
    
    @IBAction func multiplicationActionButton(_ sender: UIButton) {
        disableAllButtonByClickOne(excludedButton: sender.self)
    }
    
    @IBAction func divisionActionButton(_ sender: UIButton) {
        disableAllButtonByClickOne(excludedButton: sender.self)
    }
    
    @IBAction func equalActionButton(_ sender: Any) {
    }
    
}

