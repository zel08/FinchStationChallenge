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
        List(station.routes) { routes in
            NavigationLink(
                destination: RouteDetailView(routes: routes),
                label: {
                    Text(routes.name)
                }
            )
        }
        .navigationTitle(station.name)
    }
}

struct RouteView_Previews: PreviewProvider {
    static var previews: some View {
        RouteView(station: localData.busBay[0])
    }
}
