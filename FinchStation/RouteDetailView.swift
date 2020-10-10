//
//  RouteDetailView.swift
//  FinchStation
//
//  Created by criszelda.r.malagday on 10/8/20.
//

import SwiftUI

struct RouteDetailView: View {
    var routes: Routes
    
    var body: some View {
        VStack {
            List(routes.stop_times) { stopTime in
                RouteDetailRowView(stopTime: stopTime)
            }
        }
        
    }
}

struct RouteDetailRowView: View {
    var stopTime: StopTimes
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(stopTime.shape)
                .font(.body)
            Text("Departure Time: \(stopTime.departureTime)")
                .font(.footnote)
        }
    }
}

struct RouteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RouteDetailView(routes: localData.busBay[0].routes[0])
    }
}
