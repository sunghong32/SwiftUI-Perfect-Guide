//
//  ClockTick.swift
//  StopWatch
//
//  Created by 민성홍 on 2021/08/10.
//

import Foundation
import SwiftUI

struct ClockTick: View {
    var tickCount = 60

    var body: some View {
        ZStack {
            ForEach(0..<tickCount) { tick in
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 1, height: tick % 5 == 0 ? 20 : 10)
                    .offset(y: 110)
                    .rotationEffect(.degrees( Double(tick) / Double(tickCount) * 360))
            }
        }
    }
}
