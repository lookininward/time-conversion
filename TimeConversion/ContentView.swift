//
//  ContentView.swift
//  TimeConversion
//
//  Created by Michael Xavier on 2022-07-18.
//

import SwiftUI

struct ContentView: View {
    @State private var  inputUnit = "Seconds"
    @State private var  outputUnit = "Minutes"
    @State private var  inputNumber = 0.00
    @FocusState private var amountFocused: Bool

    let timeUnits = ["Seconds", "Minutes", "Hours", "Days"]
    
    var inSeconds: Double {
        switch inputUnit {
            case "Minutes":
                return inputNumber * 60
            case "Hours":
                return inputNumber * 3600
            case "Days":
                return inputNumber * 86400
            default:
                return inputNumber
        }
    }
    
    var outputNumber: Double {
        switch outputUnit {
            case "Minutes":
                return inSeconds / 60
            case "Hours":
                return inSeconds / 3600
            case "Days":
                return inSeconds / 86400
            default:
                return inSeconds
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(timeUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(timeUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    TextField("Enter \(inputUnit)", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountFocused)
                }
                Section {
                    Text(outputNumber, format: .number)
                } header: {
                    Text(outputUnit)
                }
            }.navigationTitle("TimeConversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
