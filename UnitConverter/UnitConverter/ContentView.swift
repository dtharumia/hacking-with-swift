//
//  ContentView.swift
//  UnitConverter
//
//  Created by Dharshan Tharumia on 3/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNum = 0.0
    @State private var inputUnit = "mi"
    @State private var outputUnit = "km"
    
    let units = ["m", "km", "ft", "yd", "mi"]
    
    var outputNum: Double {
        let toBase: [String: Double] = ["m":3.281, "km": 3281, "ft": 1, "yd": 3, "mi": 5280]
        let baseNum = (inputNum*toBase[inputUnit]!)
        return baseNum / toBase[outputUnit]!
    }
    var body: some View {

        Form {
            Section {
                TextField("Input length", value: $inputNum, format: .number)
                    .keyboardType(.decimalPad)
            } header: {
                Text("Select input length")
            }
            Section {
            Picker("Input unit", selection: $inputUnit) {
                ForEach(units, id: \.self) {
                                    Text($0)
                                }
            }
            .pickerStyle(.segmented)
            } header: {
                Text("Select input unit")
            }
            Section {
            Picker("Output unit", selection: $outputUnit) {
                ForEach(units, id: \.self) {
                                    Text($0)
                                }
            }
            .pickerStyle(.segmented)
            } header: {
                Text("Select output unit")
            }
            Section {
                Text("\(inputNum, specifier: "%.2f") \(inputUnit) is \(outputNum, specifier: "%.2f") \(outputUnit)")
            }
    }
}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
