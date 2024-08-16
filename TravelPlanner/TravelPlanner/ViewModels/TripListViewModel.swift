import Combine
import Foundation

class TripListViewModel: ObservableObject {
    @Published var trips: [Trip] = []
    @Published var selectedTrip: Trip? = nil
    @Published var showAddTripView: Bool = false

    func markAsCompleted(_ trip: Trip) {
        if let index = trips.firstIndex(where: { $0.id == trip.id }) {
            trips[index].isCompleted.toggle()
        }
    }

    func deleteTrip(at indexSet: IndexSet) {
        trips.remove(atOffsets: indexSet)
    }
}
