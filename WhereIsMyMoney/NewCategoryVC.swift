//
//  NewCategoryVC.swift
//  WhereIsMyMoney
//
//  Created by Volodymyr on 10/6/17.
//  Copyright © 2017 Volodymyr. All rights reserved.
//

import UIKit

class NewCategoryVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var selectedImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create new category"
    }
    
    var categoryModel = CategoryModel.categoryModel
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryModel.imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CrCatCell", for: indexPath) as! CrCatCollectionViewCell
        cell.crCatImg.image	= UIImage(named: categoryModel.imgArr[indexPath.row])
        cell.crCatLabel.text = categoryModel.categoryArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        selectedImage.image = UIImage(named: categoryModel.imgArr[indexPath.row])
    }


}
