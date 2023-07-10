//
//  ContentView.swift
//  SimpleMap
//
//  Created by Artem Eliseev on 19/06/2023.
//

import SwiftUI
import MapKit
import CoreLocation

var Locations: [Location] = []

struct ContentView: View {
    let timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { timer in
        Task{
            Locations = try await fetchData()
        }
    }
    @State var manager = CLLocationManager()
    @StateObject var locationManager = LocationDataManager()
    @State private var pinClicked: Bool = false
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $locationManager.region, showsUserLocation: true, annotationItems: Locations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    ZStack{
                        Button(action: {
                            self.pinClicked = true
                        }) {
                            Image(systemName: "mappin")
                                .padding()
                                .foregroundColor(.red)
                                .font(.title)
                        }.sheet(isPresented: $pinClicked, content: {
                            PinDetail()
                        })
                    }
                }
            }
            .onAppear{
                manager.delegate = locationManager
            }
        }
        .edgesIgnoringSafeArea(.all)
        // Make it start with some pins existing
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
