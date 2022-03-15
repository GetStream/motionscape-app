//
//  SliderControlView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 14.03.22.
//

import SwiftUI

struct SliderControlView: View {
    
    @Binding var value: Double
    var range: ClosedRange<Double>
    var name: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 40) {
                Text(name)
                
                Spacer()
                
                Text(value.stringWith(places: 2))
                    .font(.title)
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            }
            
            Slider(value: $value, in: range)
            
            InfoText(text: description)
                .padding(.top)
        }
        .padding()
    }
}

struct SliderControlView_Previews: PreviewProvider {
    static var previews: some View {
        SliderControlView(value: .constant(4), range: 0 ... 100, name: "Stiffness", description: "The stiffness of the animation")
    }
}
