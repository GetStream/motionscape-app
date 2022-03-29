//
//  HeadlineView.swift
//  MotionScape
//
//  Created by Stefan Blos on 21.03.22.
//

import SwiftUI

struct HeadlineView: View {
    
    var headline: String
    var description: String
    var timingCurve: TimingCurve?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(headline)
                .font(.largeTitle)
                .foregroundColor(.secondary)
                .bold()
                .padding([.horizontal, .top])
            
            Text(description)
                .padding()
            
            if let unwrappedTimingCurve = timingCurve {
                Text("Timing curve")
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding([.horizontal, .bottom])
                
                HStack {
                    Spacer()
                    
                    TimingCurveView(timingCurve: unwrappedTimingCurve)
                        .frame(width: 200, height: 200)
                    
                    Spacer()
                }
            }
            
            Divider()
        }
    }
}

struct HeadlineView_Previews: PreviewProvider {
    static var previews: some View {
        HeadlineView(headline: "Interpolating Spring", description: "An interpolating spring animation that uses a damped spring model to produce values in the range [0, 1] that are then used to interpolate within the [from, to] range of the animated property.\nPreserves velocity across overlapping animations by adding the effects of each animation.")
    }
}
