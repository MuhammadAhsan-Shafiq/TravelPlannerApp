//
//  EditTripView.swift
//  TravelPlanner
//
//  Created by MacBook Pro on 16/08/2024.
//

import SwiftUI

struct EditTripView: View {
    @ObservedObject var viewModel: TripListViewModel
    @Binding var trip: Trip
    
    var body: some View {
        Form {
            Section(header: Text("Trip Details")) {
                TextField("Destination", text: $trip.destination)
                
                DatePicker("Start Date", selection: $trip.startDate, displayedComponents: .date)
                
                DatePicker("End Date", selection: $trip.endDate, displayedComponents: .date)
                
                Toggle("Completed", isOn: $trip.isCompleted)
                
                TextField("Notes", text: $trip.notes)
            }
        }
        .navigationTitle("Edit Trip")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    // Close the sheet
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    // Save the changes and close the sheet
                }
            }
        }
    }
}

