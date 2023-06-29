//
//  PinDetail.swift
//  SimpleMap
//
//  Created by Artem Eliseev on 27/06/2023.
//

import SwiftUI

struct PinDetail: View {
	var body: some View {
		ScrollView {
			VStack(alignment: .leading) {
				HStack {
					Text("Sample text")
						.font(.title)
				}
				HStack {
					Text("text")
					Spacer()
					Text("text")
				}
				.font(.subheadline)
				.foregroundColor(.secondary)
				
				Divider()
				
				Text("About text")
					.font(.title2)
				Text("text")
			}
		}
	}
	
	struct PinDetail_Previews: PreviewProvider {
		static var previews: some View {
			PinDetail()
		}
	}
}
