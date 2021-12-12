//
//  ContentView.swift
//  SwiftUI-GA
//
//  Created by 구형모 on 2021/12/12.
//

import SwiftUI

struct ContentView: View {
    
    @State var xPos: CGFloat = 0
    @State var yPos: CGFloat = 0
    
    @State var locations: [CGPoint] = []
    
    var body: some View {
        GeometryReader { _ in
            ForEach(0..<locations.count, id:\.self) { index in
                CirclesView(index: index, offset: CGSize(width: locations[index].x, height: locations[index].y))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.thickMaterial)
        .gesture(DragGesture(minimumDistance: 0).onEnded { dragGesture in
            locations.append(dragGesture.startLocation)
            self.xPos = dragGesture.location.x
            self.yPos = dragGesture.location.y
        })
    }
}

struct CirclesView: View {
    
    let index: Int
    let offset: CGSize
    
    var body: some View {
        
        Circle()
            .strokeBorder(Color.blue, lineWidth: 2.0, antialiased: true)
            .frame(width: 50, height: 50, alignment: .center)
            .overlay(Text(String(describing: index)))
            .offset(offset)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
