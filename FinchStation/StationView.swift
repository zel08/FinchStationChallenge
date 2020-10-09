//
//  RouteView.swift
//  FinchStation
//
//  Created by criszelda.r.malagday on 10/7/20.
//

import SwiftUI
import Combine

struct StationView: View {
    @ObservedObject private var finchStationData = DataService()
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Bus Bay"))
                {
                    ForEach(finchStationData.busBay) { busBay in
                        NavigationLink(
                            destination: RouteView(station: busBay),
                            label: {
                                StationRowView(station: busBay)
                            }
                        )
                    }
                }
                Section(header: Text("Subway Flatform"))
                {
                    ForEach(finchStationData.subwayPlatform) { subway in
                        NavigationLink(
                            destination: RouteView(station: subway),
                            label: {
                                StationRowView(station: subway)
                            }
                        )
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Finch Station")
        }
    }
}

struct StationRowView: View {
    var station: Stops
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(station.name)
                .font(.headline)
            Text(station.agency)
                .font(.footnote)
        }
    }
}

struct StationView_Previews: PreviewProvider {
    static var previews: some View {
        StationView()
    }
}
