//
//  ContentView.swift
//  SimpleMap
//
//  Created by Artem Eliseev on 19/06/2023.
//

import SwiftUI
import MapKit

struct ContentView: View {
	
	let location: Location
	@State var Locations: [Location] = []
	@State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
	
	var body: some View {
		NavigationStack{
			Map(coordinateRegion: $region, annotationItems: Locations) { location in
				MapAnnotation(coordinate: location.coordinate) {
					NavigationLink {
						PinDetail()
					} label: {
						Pin()
					}
				}
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
}

		

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView(location: Location(latitude: 51, longitude: 0))
    }
}
