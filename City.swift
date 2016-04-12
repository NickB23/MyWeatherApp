//
//  City.swift
//  MyWeatherApp
//
//  Created by Nick Bruinsma on 10-04-16.
//  Copyright © 2016 ExperientiaIBW. All rights reserved.
//

import Foundation
import Alamofire

class City {
    private var _city: String!
    private var _weatherDesc: String!
    private var _weatherTemp: Int!
    private var _weatherMinTemp: Int!
    private var _weatherMaxTemp: Int!
    private var _cityURL: String!
    
    init(cityname: String) {
        self._city = cityname
        
        _cityURL = "\(URl_BASE)\(self._city)\(URL_SUFFIX)"
    }
    
    func downloadWeatherDetails(completed: DownloadComplete) {
        
        let url = NSURL(string: _cityURL)!
        
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            
            print(result.value.debugDescription)
            
        }
    }
    
}