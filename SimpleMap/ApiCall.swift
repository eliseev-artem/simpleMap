//
//  ApiCall.swift
//  SimpleMap
//
//  Created by Artem Eliseev on 20/06/2023.
//

import Foundation

// Lets me throw a string for an error
extension String: Error {}

func fetchData() async throws -> [Location] {
    guard let url = URL(string: "http://35.178.202.67/get/list/coords") else {
        throw "Invalid API URL"
    }
    let (data, _) = try await URLSession.shared.data(from: url)
	return try JSONDecoder().decode([Location].self, from: data)
}
