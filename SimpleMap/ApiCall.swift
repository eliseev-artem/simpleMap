//
//  ApiCall.swift
//  SimpleMap
//
//  Created by Artem Eliseev on 20/06/2023.
//

import Foundation

func fetchData() async throws -> [Location] {
	let url = URL(string: "http://13.41.79.78/get/list/coords")!
	let (data, _) = try await URLSession.shared.data(from: url)
	return try JSONDecoder().decode([Location].self, from: data)
}