//
//  TextFieldControlView.swift
//  MotionScape
//
//  Created by Stefan Blos on 29.03.22.
//

import SwiftUI

struct TextFieldControlView: View {
    
    @Binding var value: Double
    var parameter: AnimationParameter
    
    var body: some View {
        HStack {
            Text(parameter.name)
            
            TextField(parameter.name, value: $value, format: .number)
                .frame(width: 70)
        }
    }
}

struct TextFieldControlView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldControlView(value: .constant(0.3), parameter: TimingCurve.firstControlPointX)
    }
}
