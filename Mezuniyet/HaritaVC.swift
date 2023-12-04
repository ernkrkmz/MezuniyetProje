//
//  HaritaVC.swift
//  Mezuniyet
//
//  Created by Eren Korkmaz on 5.12.2023.
//

import UIKit

class HaritaVC: UIViewController {
    
    var isim    = ""
    var enlem   = 0
    var boylam  = 0

    
    @IBOutlet weak var isimLBL: UILabel!
    
    @IBOutlet weak var enlemLBL: UILabel!
    
    @IBOutlet weak var boylamLBL: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        isimLBL.text = isim
        enlemLBL.text = String(enlem)
        boylamLBL.text = String(boylam)
    }
    


}
