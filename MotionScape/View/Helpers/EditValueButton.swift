//
//  EditValueButton.swift
//  MotionScape
//
//  Created by Stefan Blos on 30.03.22.
//

import SwiftUI

struct EditValueButton: View {
    var body: some View {
        Image(systemName: "square.and.pencil")
            .resizable()
            .frame(width: 16, height: 16)
            .foregroundColor(.primary)
            .accessibilityLabel("Set value")
    }
}

struct EditValueButton_Previews: PreviewProvider {
    static var previews: some View {
        EditValueButton()
    }
}
