//
//  Pin.swift
//  SimpleMap
//
//  Created by Artem Eliseev on 27/06/2023.
//

import SwiftUI

struct Pin: View {

	var body: some View {
		Button(action: {
	
//		Somehow make it link to PinDetail?
		}) {
			Image(systemName: "mappin")
				.padding()
				.foregroundColor(.red)
				.font(.title)
		}
	}
}

struct Pin_Previews: PreviewProvider {
    static var previews: some View {
        Pin()
    }
}
