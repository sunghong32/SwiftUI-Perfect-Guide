//
//  ContentView.swift
//  StopWatch
//
//  Created by 민성홍 on 2021/08/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            ClockTick()
            ClockNumber()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
