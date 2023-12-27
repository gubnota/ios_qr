//
//  Participants_VC.swift
//  gopicar
//
//  Created by Vladislav Muravyev on 27.12.2023.
//

import UIKit

class Participants_VC: ViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var table: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pm.participants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {//
        var items = pm.participants;
        let cell = tableView.dequeueReusableCell(withIdentifier: "ParticipantCell", for: indexPath) as! ParticipantCell
        //        let cell = UITableViewCell()
        cell.name?.text = items[indexPath.row].fullname
//        if (items[indexPath.row].number>0) {cell.name?.text = "\(items[indexPath.row].fullname) (\(String(items[indexPath.row].number)))"}
        if(items[indexPath.row].number==0) {cell.pic.isHidden = true}
        else {
            cell.pic.isHidden = false
        }
        cell.no?.text = items[indexPath.row].number==0 ? "" : String(items[indexPath.row].number)+" "
//        cell.subviews.first?.bounds = CGRect(x: 0, y: 0, width: 400, height: 200)
         return cell
    }
    

    // MARK: - Table view delegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pm.participant = pm.participants[indexPath.row]
        // Handle the tap event for the selected cell
        let destCtrlr = Portrait_VC(nibName: "Portrait_VC", bundle: nil)
        self.navigationController?.pushViewController(destCtrlr, animated: true)
    }
  

    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(UINib(nibName: "ParticipantCell", bundle: nil), forCellReuseIdentifier: "ParticipantCell")
        table.dataSource = self
        table.delegate = self
        // Do any additional setup after loading the view.
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
