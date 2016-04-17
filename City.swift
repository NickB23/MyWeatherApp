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
    private var _weatherTemp: String!
    private var _weatherMinTemp: String!
    private var _weatherMaxTemp: String!
    private var _rainPercentile: String!
    private var _windSpeed: String!
    private var _weatherType: String!
    private var _cityURL: String!
    private var _country: String!
    private var _icon: String!
    
    var city: String {
        get {
            if _city == nil {
                _city = ""
            }
            return _city
        }
        set {
            _city = city
        }
    }
    var weatherDesc: String {
        get {
            if _weatherDesc == nil {
                _weatherDesc = ""
            }
            return _weatherDesc
        }
    }
    var weatherTemp: String {
        get {
            if _weatherTemp == nil {
                _weatherTemp = ""
            }
            return _weatherTemp
        }
    }
    var weatherMinTemp: String {
        get {
            if _weatherMinTemp == nil {
                _weatherMinTemp = ""
            }
            return _weatherMinTemp
        }
    }
    var weatherMaxTemp: String {
        get {
            if _weatherMaxTemp == nil {
                _weatherMaxTemp = ""
            }
            return _weatherMaxTemp
        }
    }
    var rainPercentile: String {
        get {
            if _rainPercentile == nil {
                _rainPercentile = ""
            }
            return _rainPercentile
        }
    }
    var windSpeed: String {
        get {
            if _windSpeed == nil {
                _windSpeed = ""
            }
            return _windSpeed
        }
    }
    var weatherType: String {
        get {
            if _weatherType == nil {
                _weatherType = ""
            }
            return _weatherType
        }
    }
    var country: String {
        get {
            if _country == nil {
                _country = ""
            }
            return _country
        }
        set {
            _country = country
        }
    }
    var icon: String {
        get {
            if _icon == nil {
                _icon = ""
            }
            return _icon
        }
        set {
            _icon = icon
        }
    }
    
    init(cityname: String) {
        self._city = cityname
        
        _cityURL = "\(URl_BASE)\(self._city)\(URL_SUFFIX)"
    }
    
    func downloadWeatherDetails(completed: DownloadComplete) {
        
        let url = NSURL(string: _cityURL)!
        
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let weatherArray = dict["weather"] as? Array<AnyObject> {
                    if let weatherArrayDict = weatherArray[0] as? Dictionary<String, AnyObject> {
                        if let description = weatherArrayDict["main"] as? String {
                            self._weatherDesc = description
                        }
                    }
                    
                }
                
                if let temperatureDict = dict["main"] as? Dictionary<String, AnyObject> {
                    if let temperature = temperatureDict["temp"] as? Double {
                        self._weatherTemp = "\(Int(temperature - 273.15))"
                    }
                }
                if let temperatureDict = dict["main"] as? Dictionary<String, AnyObject> {
                    if let temperature = temperatureDict["temp_min"] as? Double {
                        self._weatherMinTemp = "\(Int(temperature - 273.15))"
                    }
                }
                if let temperatureDict = dict["main"] as? Dictionary<String, AnyObject> {
                    if let temperature = temperatureDict["temp_max"] as? Double {
                        self._weatherMaxTemp = "\(Int(temperature - 273.15))"
                    }
                }
                if let windSpeedDict = dict["wind"] as? Dictionary<String, AnyObject> {
                    if let windSpeed = windSpeedDict["speed"] as? Double {
                        self._windSpeed = "\(windSpeed)"
                    }
                    
                }
                if let countryDict = dict["sys"] as? Dictionary<String, AnyObject> {
                    if let country = countryDict["country"] as? String {
                        self._country = country
                    }
                    
                }
                if let weatherArray = dict["weather"] as? Array<AnyObject> {
                    if let weatherArrayDict = weatherArray[0] as? Dictionary<String, AnyObject> {
                        if let icon = weatherArrayDict["icon"] as? String {
                            self._icon = icon
                        }
                    }
                }
                
                
                completed()

            }
            
        }
    }
    
}