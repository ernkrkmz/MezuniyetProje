//
//  ViewController.swift
//  Mezuniyet
//
//  Created by Eren Korkmaz on 2.12.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , UISearchBarDelegate{
    
    var bigdata : Array<DataClass.Hastane> = []
    
    var selectedData : Array<DataClass.Hastane> = []
    
    var ilceAdlari : Array<String> = []
    
    let myData = DataClass().getJsonFile()!

    let filteredList : Array<String> = []
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var selectionButon: UIButton!
    

        
    //    var selectedisim    = ""
//    var selectedenlem   = 0
//    var selectedboylam  = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
//        let obj = DataClass()
//
//        let data = obj.getJsonFile()
        self.bigdata = myData
        var ilce_adlari = Set(bigdata.map{$0.ILCE_ADI ?? "Yok"})

        
        
        ilce_adlari.map({if $0==""{ ilce_adlari.remove($0)} })
        let ilce_adlari2 = ilce_adlari.sorted()
        print(type(of: ilce_adlari2))
        var menuChildren: [UIMenuElement] = []
        menuChildren.append(UIAction(title: "İlçe seçin", handler: actionClosure))
        for ilce in ilce_adlari2 {
            menuChildren.append(UIAction(title: ilce, handler: actionClosure))
        }
        ilceAdlari = ilce_adlari2

        selectionButon.menu = UIMenu(options: .displayInline, children: menuChildren)

        selectionButon.showsMenuAsPrimaryAction = true
        selectionButon.changesSelectionAsPrimaryAction = true
        
    }
    
    let actionClosure = { (action: UIAction) in
                print(action.title)
//        let data = DataClass().getJsonFile()
        
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
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        let isimler = myData.map({ $0.ADI})
        for txt in isimler{
            
        }
    }
}

