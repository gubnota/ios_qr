//
//  ViewController2.swift
//  uikit
//
//  Created by Vladislav Muravyev on 04.12.2023.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var grid: UICollectionView!
    let data = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36]
//    init(){
//        super.init(nibName: "View2", bundle: nil)
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
        if let view = Bundle.main.loadNibNamed("View2", owner: self, options: nil)?.first as? UIView {
            self.view = view
            initCollection()
        }
        // Do any additional setup after loading the view.
    }
    
    func initCollection() -> Void {
        grid.delegate = self
        grid.dataSource = self
        grid.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "ItemCellName")
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

extension ViewController2 : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCellName", for: indexPath) as! ItemCell
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 10
        cell.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        let bgImg = UIImageView(image: UIImage(named:"record-button"))
        cell.backgroundView = bgImg
        return cell
    }
    
    
}

extension ViewController2 : UICollectionViewDelegate {
    
}

