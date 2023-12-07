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

    @IBOutlet weak var adresLBL: UILabel!
    
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
        
        
        
        isimLBL.text = gelenData.first?.ADI
        adresLBL.text = "Adres : \(gelenData.first?.ADRES ?? "Yok")"
        
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation{ return nil }
        let reuseId = "asd"
        var pinview = map.dequeueReusableAnnotationView(withIdentifier: reuseId)
        if pinview == nil {
            pinview = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinview?.canShowCallout = true
            pinview?.tintColor = .blue
            
            let button = UIButton(type: .infoDark)
            pinview?.rightCalloutAccessoryView = button
            
        }else {
            pinview?.annotation = annotation
        }
        
        return pinview
    }


    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        let gelenEnlem = gelenData.first?.ENLEM
        let strEnlem = Double(gelenEnlem ?? "Enlem yok")
        
        let gelenBoylam = gelenData.first?.BOYLAM
        let strboylam = Double(gelenBoylam ?? "Boylam yok")
        
        
            var reqLocation = CLLocation(latitude: strEnlem!, longitude:strboylam!)

            CLGeocoder().reverseGeocodeLocation(reqLocation) { placemarkDizisi, hata in
                if let placemarks = placemarkDizisi {
                    if placemarks.count > 0 {
                        
                        let yeniPlacemark = MKPlacemark(placemark: placemarks[0])
                        let item = MKMapItem(placemark: yeniPlacemark)
                        
                        item.name = self.gelenData.first?.ADI ?? " "
                        
                        let launchOptions = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
                        item.openInMaps(launchOptions: launchOptions)
                    }
                }
            }
        
    }
    
}
