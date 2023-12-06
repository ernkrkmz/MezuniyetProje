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

        let gelenEnlem = gelenData.first?.ENLEM
        let strEnlem = Double(gelenEnlem ?? "Enlem yok")
        
        let gelenBoylam = gelenData.first?.BOYLAM
        let strboylam = Double(gelenBoylam ?? "Boylam yok")
        
        let location = CLLocation(latitude: strEnlem!, longitude: strboylam!)
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 7000, longitudinalMeters: 7000)
        map.setRegion(coordinateRegion, animated: true)
        let cordinate2d = CLLocationCoordinate2D(latitude: strEnlem!, longitude: strboylam!)
        let annotation = MKPointAnnotation()
        annotation.coordinate = cordinate2d
        annotation.title = gelenData.first?.ADI
        annotation.subtitle = gelenData.first?.TELEFON ?? "Telefon bilgisi yok"
        map.addAnnotation(annotation)

//        guard let coordinate = locationManager.location?.coordinate else {return }
//        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
//
//        let reigon = MKCoordinateRegion(center: coordinate, span: span)
//        map.setRegion(reigon, animated: true)
        
        
        
        print(strEnlem)
        isimLBL.text = gelenData.first?.ENLEM
        
    }
    


}
