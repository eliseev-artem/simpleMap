//
//  Location.swift
//  SimpleMap
//
//  Created by Artem Eliseev on 20/06/2023.
//

import Foundation
import CoreLocation

struct Location: Identifiable, Decodable {
	let id = UUID()
	let latitude: Double
	let longitude: Double
	var coordinate: CLLocationCoordinate2D {
		CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
	}
}
