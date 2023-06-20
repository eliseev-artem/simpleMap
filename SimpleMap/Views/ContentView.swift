//
//  ContentView.swift
//  SimpleMap
//
//  Created by Artem Eliseev on 19/06/2023.
//

import SwiftUI
import MapKit

struct ContentView: View {
	@State var Locations: [Location] = []
	@State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    var body: some View {
			Map(coordinateRegion: $region, annotationItems: Locations) {
				MapMarker(coordinate: $0.coordinate)
			}
			.task {
				do {
					Locations = try await fetchData()
				} catch {
					print(error)
				}
			}
		}
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
