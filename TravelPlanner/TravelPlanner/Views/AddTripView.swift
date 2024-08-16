import SwiftUI

import SwiftUI

import SwiftUI

struct AddTripView: View {
    @ObservedObject var viewModel: TripListViewModel
    @State private var destination: String = ""
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date()
    @State private var notes: String = ""
    @State private var isCompleted: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Trip Details")) {
                    TextField("Destination", text: $destination)
                    
                    DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                    
                    DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                    
                    Toggle("Completed", isOn: $isCompleted)
                    
                    TextField("Notes", text: $notes)
                }
            }
            .navigationTitle("Add New Trip")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        viewModel.showAddTripView = false
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let newTrip = Trip(
                            id: UUID(),
                            destination: destination,
                            startDate: startDate,
                            endDate: endDate,
                            isCompleted: isCompleted,
                            notes: notes
                        )
                        viewModel.trips.append(newTrip)
                        viewModel.showAddTripView = false
                    }
                    .disabled(destination.isEmpty || startDate > endDate)
                }
            }
        }
    }
}

#Preview {
    AddTripView(viewModel: TripListViewModel())
}
