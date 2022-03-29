//
//  TimingCurveView.swift
//  MotionScape
//
//  Created by Stefan Blos on 21.03.22.
//

import SwiftUI

struct TimingCurveView: View {
    
    var timingCurve: TimingCurve
    
    let pointRadius: CGFloat = 20
    
    var body: some View {
        GeometryReader { reader in
            ZStack {
                // Background
                Path { path in
                    path.move(to: CGPoint(x: 0, y: reader.size.height / 2))
                    path.addLine(to: CGPoint(x: reader.size.width, y: reader.size.height / 2))
                    
                    path.move(to: CGPoint(x: reader.size.width / 2, y: 0))
                    path.addLine(to: CGPoint(x: reader.size.width / 2, y: reader.size.height))
                }
                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                
                // Control points
                Path { path in
                    let firstPoint = createFirstControlPoint(for: timingCurve, in: reader.size)
                    let secondPoint = createSecondControlPoint(for: timingCurve, in: reader.size)
                    
                    path.addEllipse(in: CGRect(x: firstPoint.x - pointRadius / 2, y: firstPoint.y - pointRadius / 2, width: pointRadius, height: pointRadius))
                    
                    path.addEllipse(in: CGRect(x: secondPoint.x - pointRadius / 2, y: secondPoint.y - pointRadius / 2, width: pointRadius, height: pointRadius))
                }
                .fill(Color.primary)
                
                // Curve
                Path { path in
                    path.move(to: CGPoint(x: 0, y: reader.size.height))
                    let firstPoint = createFirstControlPoint(for: timingCurve, in: reader.size)
                    let secondPoint = createSecondControlPoint(for: timingCurve, in: reader.size)
                    
                    path.addCurve(
                        to: CGPoint(
                            x: reader.size.width,
                            y: 0
                        ),
                        control1: firstPoint,
                        control2: secondPoint
                    )
                }
                .stroke(Color.accentColor, lineWidth: 6)

            }
            .overlay(Rectangle().stroke(Color.secondary, lineWidth: 2))
            .clipShape(Rectangle())
        }
    }
    
    func createFirstControlPoint(for curve: TimingCurve, in size: CGSize) -> CGPoint {
        return CGPoint(
            x: curve.x0 * size.width,
            y: size.height - curve.y0 * size.height
        )
    }
    
    func createSecondControlPoint(for curve: TimingCurve, in size: CGSize) -> CGPoint {
        return CGPoint(
            x: curve.x1 * size.width,
            y: size.height - curve.y1 * size.height
        )
    }
}

struct TimingCurveView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TimingCurveView(timingCurve: TimingCurve(x0: 0.17, y0: 0.67, x1: 0.83, y1: 0.67))
                .previewLayout(.fixed(width: 300, height: 300))
            TimingCurveView(timingCurve: TimingCurve(x0: 0.17, y0: 0.67, x1: 0.83, y1: 0.67))
                .previewLayout(.fixed(width: 300, height: 200))
            TimingCurveView(timingCurve: TimingCurve(x0: 0.17, y0: 0.67, x1: 0.83, y1: 0.67))
                .previewLayout(.fixed(width: 200, height: 300))
        }
    }
}
