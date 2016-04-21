//
//  CityDetailVC.swift
//  MyWeatherApp
//
//  Created by Nick Bruinsma on 10-04-16.
//  Copyright © 2016 ExperientiaIBW. All rights reserved.
//

import UIKit

class CityDetailVC: UIViewController {
    
    @IBOutlet weak var CityNameLabel: UILabel!
    
    @IBOutlet weak var WeatherIcon: UIImageView!
    
    @IBOutlet weak var DayLabel: UILabel!
    
    @IBOutlet weak var TemperatureLabel: UILabel!
    
    @IBOutlet weak var CloudPercentileLabel: UILabel!
    
    @IBOutlet weak var WindPercentileLabel: UILabel!
    
    
    var cit: City!

    override func viewDidLoad() {
        super.viewDidLoad()

        CityNameLabel.text = cit.city
        cit.downloadWeatherDetails { () -> () in
            self.updateUI()
        }
    }
    
    func updateUI() {
        CityNameLabel.text = "\(cit.city.capitalizedString), \(cit.country)"
        DayLabel.text = cit.weatherDesc
        TemperatureLabel.text = " \(cit.weatherTemp)°C"
        WindPercentileLabel.text = " \(cit.windSpeed) m/s"
        let img = UIImage(named: "\(cit.icon)")
        WeatherIcon.image = img
        CloudPercentileLabel.text = " \(cit.cloudPercentage)%"
    }

    @IBAction func BackBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
