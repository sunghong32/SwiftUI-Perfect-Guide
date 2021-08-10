//
//  ClockNumber.swift
//  StopWatch
//
//  Created by 민성홍 on 2021/08/10.
//

import Foundation
import SwiftUI

struct ClockNumber: View {
    var tickCount = 60

    var body: some View {
        ZStack {
            ForEach(0..<tickCount) { tick in
                if tick % 5 == 0 {
                    ZStack {
                        Text("\(tick)")
                            .rotationEffect(.degrees( Double(tick) / Double(tickCount) * -360))
                    }
                    .offset(y: -135)
                    .rotationEffect(.degrees( Double(tick) / Double(tickCount) * 360))
                }
            }
        }
    }
}
