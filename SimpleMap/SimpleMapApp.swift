//
//  SimpleMapApp.swift
//  SimpleMap
//
//  Created by Artem Eliseev on 19/06/2023.
//

import SwiftUI

@main
struct SimpleMapApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(location: Location(latitude: 51, longitude: 0))
        }
    }
}
