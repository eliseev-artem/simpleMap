//
//  ContentView.swift
//  SimpleMap
//
//  Created by Artem Eliseev on 19/06/2023.
//

import SwiftUI
import MapKit

var Locations: [Location] = []

let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
    Task{
        Locations = try await fetchData()
    }
    print(Locations)
    print("123")
}

struct ContentView: View {
    @State var pinClicked: Bool = false
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    var body: some View {
        ZStack{
            Map(coordinateRegion: $region, annotationItems: Locations) { location in
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
        }
            .edgesIgnoringSafeArea(.all)
//            .task {
//                do {
//                    Locations = try await fetchData()
//                } catch {
//                    print(error)
//                }
//            }
        }
    }

    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView()
    }
}
