//
//  Data.swift
//  AutoPlannerClient
//
//  Created by Michael Berk on 5/2/21.
//

import Foundation

struct Subject: Codable, Hashable, Identifiable {
	var name: String
	var priority: Double
	var totalDuration: Double
	var id = UUID()
}

struct Test: Codable, Hashable {
	var name: String
	var month: Int
	var day: Int
	
}
