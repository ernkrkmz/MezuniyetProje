//
//  DataClass.swift
//  Mezuniyet
//
//  Created by Eren Korkmaz on 4.12.2023.
//

import Foundation

class DataClass{
    
    struct Hastane: Decodable{
        
        let ILCE_UAVT: Int?
        let ILCE_ADI: String?
        let ADI: String?
        let ALT_KATEGORI : String?
        let ADRES : String?
        let TELEFON : String?
        let WEBSITESI : String?
        let ACIL_SERVIS: String?
        let YATAK: Int?
        let AMBULANS: String?
        let MAHALLE: String?
        let ENLEM: String?
        let BOYLAM: String?
        
        
        
    }
    
    func getJsonFile() -> Array<Hastane>?{
        let decoder = JSONDecoder()
        let url = Bundle.main.path(forResource: "jsonFile", ofType:"json")
        
        do {
                if let filePath = Bundle.main.path(forResource: "jsonFile", ofType: "json") {
                    let fileUrl = URL(fileURLWithPath: filePath)
                    let data = try Data(contentsOf: fileUrl)
                    let decodedData = try JSONDecoder().decode([Hastane].self, from: data)
                    return decodedData
                }
            } catch {
                print("error: \(error)")
                
            }
        return nil
    }
    
    
    func getJsonData() {
        
        guard let url = URL(string: "https://data.ibb.gov.tr/tr/dataset/bd3b9489-c7d5-4ff3-897c-8667f57c70bb/resource/6800ea2d-371b-4b90-9cf1-994a467145fd/download/salk-kurum-ve-kurulularna-ait-bilgiler.json") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return }
            do{
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [String: Any] {
                               print("JSON: \(json)")
                            } else {
                               print("Given JSON is not a valid dictionary object.")
                            }
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
}

