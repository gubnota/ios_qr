//
//  ListLettersVC.swift
//  uikit
//
//  Created by Vladislav Muravyev on 04.12.2023.
//

import UIKit

class ListLettersVC: UIViewController, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var grid: UICollectionView!
    @IBOutlet weak var bgView: UIView!

    let data = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36]
//    init(){
//        super.init(nibName: "ListLetters", bundle: nil)
//    }
//    
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
////        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load the view from the xib file
        // Do any additional setup after loading the view.
        if let view = Bundle.main.loadNibNamed("ListLetters", owner: self, options: nil)?.first as? UIView {
            self.view = view
            initCollection()
        }
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        coordinator.animate(alongsideTransition: { (context) in
                   if let windowInterfaceOrientation = UIApplication.shared.windows.first?.windowScene?.interfaceOrientation {
                       if windowInterfaceOrientation.isLandscape {
                           // Activate landscape changes
                       } else {
                           // Activate portrait changes
                       }
                   }
               })

    }
    func initCollection() -> Void {
        grid.delegate = self
        grid.dataSource = self
//        var l = ListLettersViewLayout()
//        l.rowNum = 2
//        grid.collectionViewLayout = l
        grid.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "ItemCellName")
//        grid.setCollectionViewLayout(LeftFlowLayout(), animated:true)
//        print("view.subviews.first?.frame.width = \(view.subviews.first?.frame.width ?? 0)");
//        print("grid.frame.width = \(grid.frame.width), grid.frame.height = \(grid.frame.height)");
//        print("isLandscape = \(UIApplication.shared.windows.first?.windowScene?.interfaceOrientation.isLandscape ?? false)")
//        let width = bgView.frame.width - 100 // grid.bounds.width
//        let l = UICollectionViewFlowLayout()
//        l.minimumLineSpacing = 0
//        l.minimumInteritemSpacing = 0
//        l.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
//        l.itemSize = CGSize(width: width/3, height: width/3)
//        let numberOfItemsPerRow: CGFloat = 3
//        let spacing: CGFloat = l.minimumInteritemSpacing
//        let availableWidth = width - spacing * (numberOfItemsPerRow + 1)
//        let itemDimension = floor(availableWidth / numberOfItemsPerRow)
//        l.itemSize = CGSize(width: itemDimension, height: itemDimension)
//        grid.collectionViewLayout = l

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewFlowLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        // Set the size of each item
//        let width = bgView.frame.width
//        print("width/4 \(width/4)");
////        let numberOfItemsPerRow: CGFloat = 3
////        let spacing: CGFloat = collectionViewLayout.minimumInteritemSpacing
////        let availableWidth = width - spacing * (numberOfItemsPerRow + 1)
////        let itemDimension = floor(availableWidth / numberOfItemsPerRow)
////        return CGSize(width: itemDimension, height: itemDimension)
//        print(CGSize(width: width/4, height: width/4))
//        return CGSize(width: width/4, height: width/4)
//
////        if indexPath.row == 0
////        {
////            return CGSize(width: width, height: width/3)
////        }
////        return CGSize(width: width/3, height: width/3);
//    }
}

extension ListLettersVC : UICollectionViewDataSource,UIGestureRecognizerDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCellName", for: indexPath) as! ItemCell
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 10
        cell.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
//        let bgImg = UIImageView(image: UIImage(named:"record-button"))
//        cell.backgroundView = bgImg
        cell.lbl.text = "\(self.data[indexPath.item])"
        cell.lbl.sizeToFit()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped(_:)))
        tapGesture.delegate = self
        cell.addGestureRecognizer(tapGesture)

        return cell
    }
    
    @objc func cellTapped(_ gesture: UITapGestureRecognizer){
        // Handle the tap event on the cell
        if let tappedCell = gesture.view as? ItemCell {//UICollectionViewCell
            // Your code to handle the tap event on the cell
            print("tapped cell \(tappedCell.lbl?.text)")
            let destCtrlr = GlyphVC(nibName: "Glyph", bundle: nil)
            destCtrlr.label = tappedCell.lbl.text ?? "";
            self.navigationController?.pushViewController(destCtrlr, animated: true)

        }
    }
    


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        // Set the spacing between cells
        return 0
    }
    
}

extension ListLettersVC : UICollectionViewDelegate {
    
}

