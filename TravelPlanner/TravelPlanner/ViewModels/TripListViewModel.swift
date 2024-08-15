//
//  TripListViewModel.swift
//  TravelPlanner
//
//  Created by MacBook Pro on 15/08/2024.
//

import Foundation

class TripListViewModel: ObservableObject {
    @Published var trips: [Trip] = [
        Trip(destination: "Paris", startDate: Date(), endDate: Date().addingTimeInterval(86400 * 7), notes: "Visit the Eiffel Tower"),
        Trip(destination: "New York", startDate: Date(), endDate: Date().addingTimeInterval(86400 * 5), notes: "Explore Central Park")
    ]
}
