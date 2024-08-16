//
//  Trip.swift
//  TravelPlanner
//
//  Created by MacBook Pro on 15/08/2024.
//

import Foundation
import Foundation

struct Trip: Identifiable {
    let id: UUID
    var destination: String
    var startDate: Date
    var endDate: Date
    var isCompleted: Bool
    var notes: String
}
