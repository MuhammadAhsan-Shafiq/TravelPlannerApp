//
//  TripListView.swift
//  TravelPlanner
//
//  Created by MacBook Pro on 15/08/2024.
//

import SwiftUI

struct TripListView: View {
    @ObservedObject var viewModel: TripListViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.trips) { trip in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(trip.destination)
                                .font(.headline)
                                .strikethrough(trip.isCompleted)
                            Spacer()
                            Button(action: {
                                viewModel.markAsCompleted(trip)
                            }) {
                                Image(systemName: trip.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(trip.isCompleted ? .green : .gray)
                            }
                        }
                        Text("\(trip.startDate, formatter: dateFormatter) - \(trip.endDate, formatter: dateFormatter)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text(trip.notes)
                            .font(.body)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 2)
                    )
                    .contextMenu {
                        Button(action: {
                            viewModel.selectedTrip = trip
                            viewModel.showAddTripView = true
                        }) {
                            Label("Edit Trip", systemImage: "pencil")
                        }
                        Button(action: {
                            viewModel.deleteTrip(at: IndexSet(integer: viewModel.trips.firstIndex(where: { $0.id == trip.id })!))
                        }) {
                            Label("Delete Trip", systemImage: "trash")
                        }
                    }
                }
            }
            .navigationTitle("Trips")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.selectedTrip = nil
                        viewModel.showAddTripView = true
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.blue)
                    }
                }
            }
            .sheet(isPresented: $viewModel.showAddTripView) {
                if let tripToEdit = viewModel.selectedTrip {
                    EditTripView(viewModel: TripListViewModel(), trip: $viewModel.trips[viewModel.trips.firstIndex(where: { $0.id == tripToEdit.id })!])
                } else {
                    AddTripView(viewModel: viewModel)
                }
            }
        }
    }
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()

#Preview {
    TripListView(viewModel: TripListViewModel())
}
