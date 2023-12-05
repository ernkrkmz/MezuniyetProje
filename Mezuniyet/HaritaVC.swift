//
//  HaritaVC.swift
//  Mezuniyet
//
//  Created by Eren Korkmaz on 5.12.2023.
//

import UIKit
import MapKit

class HaritaVC: UIViewController , MKMapViewDelegate , CLLocationManagerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    var locationManager = CLLocationManager()

    
    var isim    = ""
    var enlem   = 0
    var boylam  = 0

    var gelenData : Array<DataClass.Hastane> = []

    @IBOutlet weak var isimLBL: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        map.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()

        
        guard let coordinate = locationManager.location?.coordinate else {return }
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)

        let reigon = MKCoordinateRegion(center: coordinate, span: span)
        map.setRegion(reigon, animated: true)
        
        isimLBL.text = gelenData.first?.ADI
        
    }
    


}
