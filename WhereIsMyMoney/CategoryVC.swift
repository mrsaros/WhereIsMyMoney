//
//  CategoryVC.swift
//  WhereIsMyMoney
//
//  Created by Volodymyr on 10/6/17.
//  Copyright © 2017 Volodymyr. All rights reserved.
//

import UIKit

class CategoryVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var transactionSumTextField: UITextField!
    @IBOutlet weak var transactionDescrTextField: UITextField!
    @IBOutlet weak var transactionStatus: UISegmentedControl!
    var status: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New transaction"
    }
    
    var dataModel = DataMolel.dataMolel
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataModel.categoryes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "catCell", for: indexPath) as! NewTransCollectionViewCell
        cell.categoryImage.image	= UIImage(named: dataModel.categoryes[indexPath.row].categoryImg)
        cell.categoryLabel.text = dataModel.categoryes[indexPath.row].categoryName
        return cell
    }
    
    @IBAction func createNewCategoryButton(_ sender: Any) {
        self.performSegue(withIdentifier: "createNewCategorySegue", sender: self)
    }
    
    @IBAction func transactionstatus(_ sender: Any) {
        status = transactionStatus.selectedSegmentIndex == 0 ? false : true
    }
    
    @IBAction func crateTransactionButton(_ sender: Any) {
        self.performSegue(withIdentifier: "createTransactionSegue", sender: self)
    }
    
    override func prepare(for createTransactionSegue: UIStoryboardSegue, sender: Any?) {
        dataModel.addToTransactions(transactionImg: "img_16.jpg", transactionDescr: transactionDescrTextField.text!, transactionSum: Double(transactionSumTextField.text!)!, transactionStatus: status)
    }
    
    
    
}