//
//  TripListView.swift
//  TravelPlanner
//
//  Created by MacBook Pro on 15/08/2024.
//

import SwiftUI

struct TripListView: View {
    @StateObject var viewModel = TripListViewModel()
    var body: some View {
        NavigationView{
            List(viewModel.trips){ trip in
                Text(trip.destination)
            }
            .navigationTitle("Trips")
        }
    }
}

#Preview {
    TripListView()
}
