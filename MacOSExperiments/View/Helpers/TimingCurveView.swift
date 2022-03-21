//
//  TimingCurveView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 21.03.22.
//

import SwiftUI

struct TimingCurveView: View {
    
    var timingCurve: TimingCurve
    
    let pointRadius: CGFloat = 10
    
    var body: some View {
        GeometryReader { reader in
            ZStack {
                Path { path in
                    path.move(to: CGPoint(x: 0, y: reader.size.width))
                    
                    let firstPoint = createFirstControlPoint(for: timingCurve, in: reader.size.width)
                    let secondPoint = createSecondControlPoint(for: timingCurve, in: reader.size.width)
                    
                    path.addCurve(
                        to: CGPoint(
                            x: reader.size.width,
                            y: 0
                        ),
                        control1: firstPoint,
                        control2: secondPoint
                    )
                    
                    path.addEllipse(in: CGRect(x: firstPoint.x - pointRadius / 2, y: firstPoint.y - pointRadius / 2, width: pointRadius, height: pointRadius))
                    
                    path.addEllipse(in: CGRect(x: secondPoint.x - pointRadius / 2, y: secondPoint.y - pointRadius / 2, width: pointRadius, height: pointRadius))
                }
                .stroke(Color.accentColor, lineWidth: 8)
                .frame(width: reader.size.width, height: reader.size.width, alignment: .center)
            }
            .overlay(Rectangle().stroke(Color.secondary, lineWidth: 2))
        }
    }
    
    func createFirstControlPoint(for curve: TimingCurve, in size: CGFloat) -> CGPoint {
        return CGPoint(
            x: curve.x0 * size,
            y: size - curve.y0 * size
        )
    }
    
    func createSecondControlPoint(for curve: TimingCurve, in size: CGFloat) -> CGPoint {
        return CGPoint(
            x: curve.x1 * size,
            y: size - curve.y1 * size
        )
    }
}

struct TimingCurveView_Previews: PreviewProvider {
    static var previews: some View {
        TimingCurveView(timingCurve: TimingCurve(x0: 0.17, y0: 0.67, x1: 0.83, y1: 0.67))
    }
}
