//
//  ContentView.swift
//  TravelPlanner
//
//  Created by MacBook Pro on 15/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TripListView(viewModel: TripListViewModel())
               
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
