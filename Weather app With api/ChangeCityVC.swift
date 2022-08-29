//
//  ChangeCityVC.swift
//  Weather app With api
//
//  Created by Macbook on 29/08/2022.
//

import UIKit

class ChangeCityVC: UIViewController {

    var citiesArray =  [
        City.init(name: "Rayad", id: "108410"),
        City.init(name: "Dammam", id: "110336"),
        City.init(name: "Gada", id: "105343"),
        City.init(name: "abha", id: "110690")
        
    
    ]
    
   
    var selectedCity : City?
    
    @IBOutlet weak var CityPickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()

         
        CityPickerView.delegate = self
        CityPickerView.dataSource = self
    }
    
   
    @IBAction func editCityButton(_ sender: Any) {
        
        if let city = selectedCity{
          
            NotificationCenter.default.post(name: NSNotification.Name("CityValueChanged"), object: nil , userInfo: ["City" : city])
            
            self.navigationController?.popViewController(animated: true)
        }
        
        
        
    }
    
    
    
     
}


extension ChangeCityVC : UIPickerViewDelegate,UIPickerViewDataSource{
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return citiesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return citiesArray[row].name
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCity = citiesArray[row]
    }
    
    
    
    
}
