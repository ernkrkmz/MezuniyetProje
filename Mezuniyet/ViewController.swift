//
//  ViewController.swift
//  Mezuniyet
//
//  Created by Eren Korkmaz on 2.12.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var bigdata : Array<DataClass.Hastane> = []
    
    var selectedData : Array<DataClass.Hastane> = []

    
//    var selectedisim    = ""
//    var selectedenlem   = 0
//    var selectedboylam  = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        let obj = DataClass()

        let data = obj.getJsonFile()
        self.bigdata = data!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bigdata.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell()
            cell.textLabel?.text = self.bigdata[indexPath.row].ADI
            return cell
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toHaritaVC" {
            let destinationVC = segue.destination as! HaritaVC
            destinationVC.gelenData = selectedData
            
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedData = [bigdata[indexPath.row]]
        
        performSegue(withIdentifier: "toHaritaVC", sender: nil)
    }

}

