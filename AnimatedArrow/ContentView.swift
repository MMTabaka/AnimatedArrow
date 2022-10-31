//
//  ContentView.swift
//  AnimatedArrow
//
//  Created by Miłosz Tabaka on 31/10/2022.
//

import SwiftUI

struct Arrow: Shape {
    var inset: Double
    
    var animatableData: Double {
        get { inset }
        set { inset = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let x = rect.maxX / 100
        let y = rect.maxY / 100
        
        path.move(to: CGPoint(x: x * 90, y: rect.midY))
        path.addLine(to: CGPoint(x: x * 65 - inset, y: y * 25 - inset))
        path.addLine(to: CGPoint(x: x * 56 - inset, y: y * 34 - inset))
        path.addLine(to: CGPoint(x: x * 65, y: y * 43))
        path.addLine(to: CGPoint(x: x * 30, y: y * 43))
        
        path.move(to: CGPoint(x: x * 25, y: y * 43))
        path.addLine(to: CGPoint(x: x * 15, y: y * 43))
        
        path.move(to: CGPoint(x: x * 90, y: rect.midY))
        path.addLine(to: CGPoint(x: x * 65 - inset, y: y * 75 + inset))
        path.addLine(to: CGPoint(x: x * 56 - inset, y: y * 66 + inset))
        path.addLine(to: CGPoint(x: x * 65, y: y * 57))
        path.addLine(to: CGPoint(x: x * 40, y: y * 57))
        
        path.move(to: CGPoint(x: x * 35, y: y * 57))
        path.addLine(to: CGPoint(x: x * 28, y: y * 57))
        
        path.move(to: CGPoint(x: x * 55, y: rect.midY))
        path.addLine(to: CGPoint(x: x * 22, y: rect.midY))
        
        return path
    }
}

struct ContentView: View {
    @State private var inset = 10.0
    
    var body: some View {
        VStack {
            Arrow(inset: inset)
                .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .frame(width: 400, height: 400)
                .contentShape(Rectangle())
                .border(.yellow, width: 3)
                .onTapGesture {
                    withAnimation {
                        inset = Double.random(in: 0...50)
                    }
                }
            
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
