//
//  Data.swift
//  FinchStation
//
//  Created by criszelda.r.malagday on 10/8/20.
//

import UIKit
import SwiftUI
import Combine
import Alamofire

class DataService : ObservableObject{
    @Published var busBay = [Stops]()
    @Published var subwayPlatform = [Stops]()

    init() {
        fetchData()
    }
    
    func fetchData() {
        AF.request("https://myttc.ca/finch_station.json").responseJSON { (response) in
            let finchStationData = try! JSONDecoder().decode(FinchStation.self, from: response.data!)
            self.busBay = finchStationData.busBay
            self.subwayPlatform = finchStationData.subwayPlatform
        }
    }
}

// for local json debug
var localData: FinchStation = load("station.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
