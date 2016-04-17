//
//  ViewController.swift
//  MyWeatherApp
//
//  Created by Nick Bruinsma on 10-04-16.
//  Copyright © 2016 ExperientiaIBW. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var CitySearchBarOutlet: UITextField!
    
    var city: City!
    var cit: City!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func CitySearchBar(sender: AnyObject) {
        
        if CitySearchBarOutlet.text != nil {
            var searchbarstring: String
            searchbarstring = CitySearchBarOutlet.text!
            
            let trimmedString = searchbarstring.stringByReplacingOccurrencesOfString(" ", withString: "")
            
            cit = City(cityname: trimmedString)
            print(cit.city)
            performSegueWithIdentifier("CityDetailVC", sender: cit)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "CityDetailVC" {
            if let detailsVC = segue.destinationViewController as? CityDetailVC {
                if let cit = sender as? City {
                    detailsVC.cit = cit
    }
            }
        }
    }
}