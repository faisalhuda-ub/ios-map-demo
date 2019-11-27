//
//  ViewController.swift
//  MapDemoo
//
//  Created by Fais Al Huda on 26/11/19.
//  Copyright © 2019 UB. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UIPickerViewDataSource,
    UIPickerViewDelegate
{
    // deklarasi outlet object mapview yang ada pada storyboard
    @IBOutlet weak var mapView: MKMapView!
    
    // deklarasi outlet object picker view
    @IBOutlet weak var pickerView: UIPickerView!
    
    // Deklarasi variabel untuk menyimpan data lokasi yang berupa latitude
    // dan longitude
    var location: CLLocation!
    
    // array tempat yang akan diisikan pada picker view
    let places = ["ITB", "UI", "UB"]
    
    // array lokasi(latitude dan longitude) berdasarkan opsi array places
    var locations = [CLLocation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerView.delegate = self
        pickerView.dataSource = self
        
        // Menambahkan informasi latitude dan longitude untuk setiap lokasi
        locations.append(CLLocation(latitude: -6.89148, longitude: 107.6084704))
        locations.append(CLLocation(latitude: -6.3627585, longitude: 106.8248542))
        locations.append(CLLocation(latitude: -7.9525043, longitude: 112.6116717))
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return places.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // Setiap kali index picker view berubah maka posisi peta akan menyesuaikan
        setLocation(location: locations[row])
        return places[row]
    }
    
    func setLocation(location: CLLocation) {
        // menentukan posisi inti pada peta map view beserta radius latitude dan
        // longitude
        let mapRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        // menerapkan region dari aturan yang sudah dibuat
        mapView.setRegion(mapRegion, animated: true)
        
    }


}

