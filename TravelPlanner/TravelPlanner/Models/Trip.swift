//
//  Trip.swift
//  TravelPlanner
//
//  Created by MacBook Pro on 15/08/2024.
//

import Foundation
struct Trip: Identifiable{
    var id =  UUID()
    let destination: String
    let startDate: Date
    let endDate: Date
    let notes: String
}
