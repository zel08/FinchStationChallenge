//
//  RouteView.swift
//  FinchStation
//
//  Created by criszelda.r.malagday on 10/8/20.
//

import SwiftUI

struct RouteView: View {
    var station: Stops
    
    var body: some View {
        List(station.routes) { route in
            NavigationLink(
                destination: RouteDetailView(routes: route),
                label: {
                    RouteRowView(route: route)
                }
            )
        }
        .navigationTitle(station.name)
    }
}

struct RouteRowView: View {
    var route: Routes
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(route.name)
                .font(.body)
                .fontWeight(.bold)
            Text("""
                    Next Departure:
                    \(route.stop_times.first?.departureTime ?? "")
                    \(route.stop_times.first?.shape ?? "")
                    """)
                .font(.footnote)
        }
    }
}

struct RouteView_Previews: PreviewProvider {
    static var previews: some View {
        RouteView(station: localData.busBay[0])
    }
}
