//
//  ContentView.swift
//  Circular_Progress
//
//  Created by 민성홍 on 2021/08/10.
//

import SwiftUI

struct ContentView: View {
    @State private var progress: CGFloat = 0
    var body: some View {
        VStack {
            Slider(value: $progress)

            CircularProgessBar(progress: $progress)
            CircularProgessBar(progress: $progress)
            CircularProgessBar(progress: $progress)

        }
        .padding(30)
    }
}

struct CircularProgessBar: View {
    @Binding var progress: CGFloat
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: 20)

            Circle()
                .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundColor(progress == 1 ? Color.green : Color.red)
                .rotationEffect(.degrees(-90))

            Text("\(Int(progress * 100))" + "%")
                .foregroundColor(progress == 1 ? Color.green : Color.red)
                .font(.largeTitle)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
