//
//  FinchStation.swift
//  FinchStation
//
//  Created by criszelda.r.malagday on 10/8/20.
//

import SwiftUI

struct FinchStation: Hashable, Codable {
    fileprivate var stops: [Stops]

    var busBay: [Stops] {
        stops.filter { $0.name.contains("Bus Bay") }
    }
    
    var subwayPlatform: [Stops] {
        stops.filter { $0.name.contains("Subway Platform") }
    }
}

struct Stops: Hashable, Codable, Identifiable {
    var routes: [Routes]
    var name: String
    fileprivate var uri: String
    var agency: String
    
    var id: String {
        uri
    }
}

struct Routes: Hashable, Codable, Identifiable {
    var stop_times: [StopTimes]
    var route_group_id: String
    var name: String
    fileprivate var uri: String
    
    var id: String {
        uri
    }
}

struct StopTimes: Hashable, Codable, Identifiable {
    fileprivate var departure_time: String
    var shape: String
    var departure_timestamp: Int
    var service_id: Int
    
    var id: String {
        return "\(departure_timestamp)_\(service_id)"
    }
    
    var departureTime: String {
        var formattedTime = departure_time
        
        let time = departure_time.dropLast()
        let lastCharacter = departure_time.last
        
        if lastCharacter == "a" {
            formattedTime = "\(time) AM"
        }
        
        if lastCharacter == "p" {
            formattedTime = "\(time) PM"
        }
        
        return formattedTime
    }
}
