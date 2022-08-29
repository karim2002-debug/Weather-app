//
//  ViewController.swift
//  Weather app With api
//
//  Created by Macbook on 29/08/2022.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    
    //sa
    @IBOutlet weak var loaderActivityIndecator: UIActivityIndicatorView!
    @IBOutlet weak var CityNameLabel: UILabel!
    @IBOutlet weak var pressLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
         
        NotificationCenter.default.addObserver(self, selector: #selector(CityChanged), name: NSNotification.Name("CityValueChanged"), object: nil)
        
        callApi()
    }
    @objc func CityChanged(notfication : Notification){
        
        if let city = notfication.userInfo?["City"] as? City{
            CityNameLabel.text = city.name
            cityId = city.id
            callApi()
        }
    }
    
    
    var cityId : String = "108410"
    func callApi(){
        
        loaderActivityIndecator.startAnimating()
        let params = ["id" : cityId , "appid" : "495375859304beffd9af4c94d66e02fc"]
        
        AF.request("https://api.openweathermap.org/data/2.5/weather", parameters: params, encoder: URLEncodedFormParameterEncoder.default).responseJSON { response in
            
            if let result = response.value{
                
                let JSONDictionary = result as! NSDictionary
                let main = JSONDictionary["main"] as! NSDictionary
                var temp = main["temp"] as! Double
                var press = main["pressure"] as! Double
                var humidity = main["humidity"] as! Double
                
                temp = temp - 272.15
                
                temp = Double(round(1000*temp) / 1000)
                self.loaderActivityIndecator.isHidden = false
                self.loaderActivityIndecator.stopAnimating()
                self.loaderActivityIndecator.isHidden = true
                self.tempLabel.text = "\(temp)˚"
                self.pressLabel.text = "\(press)˚"
                self.humidityLabel.text = "\(humidity)˚"
                
                
            }
            
        }
        
        
        
    }


}

