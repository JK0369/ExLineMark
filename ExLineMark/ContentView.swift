//
//  ContentView.swift
//  ExLineMark
//
//  Created by 김종권 on 2023/10/31.
//

import SwiftUI
import Charts

struct Data {
    let name: String = "jake"
    let date: Date
    let value: Int
}

struct ContentView: View {
    let datas = [
        Data(date: .now, value: 10),
        Data(date: .now.addingTimeInterval(5), value: 5),
        Data(date: .now.addingTimeInterval(15), value: 15),
        Data(date: .now.addingTimeInterval(30), value: 8),
        Data(date: .now.addingTimeInterval(50), value: 9),
    ]
    let markColors: [LinearGradient] = [
            LinearGradient(colors: [.yellow, .orange], startPoint: .leading, endPoint: .trailing),
            LinearGradient(colors: [.blue, .mint], startPoint: .leading, endPoint: .trailing),
        ]
    
    var body: some View {
        Chart {
            ForEach(datas, id: \.date) { item in
                LineMark(
                    x: .value("Date", item.date),
                    y: .value("Value", item.value)
                )
                .foregroundStyle(by: .value("Some Category", item.name))
                .shadow(color: .brown, radius: 3)
            }
            RuleMark(
                y: .value("Threshold", 9.5)
            )
            .foregroundStyle(by: .value("Threshold", "Threshold"))
            .shadow(color: .brown, radius: 3)
        }

    }
}

#Preview {
    ContentView()
}
