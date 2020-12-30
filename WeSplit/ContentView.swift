//  Hacking With Swift Day 16,17,18
//  December 18, 2020
//  ContentView.swift
//  WeSplit
//
//  Created by Alison Gorman on 12/18/20.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [15, 20, 25, 0]
    
    var zero: Bool {
        (tipPercentage == 3)
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople) ?? 1
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var totalAmount: Double {
            let tipSelection = Double(tipPercentages[tipPercentage])
            let orderAmount = Double(checkAmount) ?? 0
            
            let tipValue = orderAmount / 100 * tipSelection
            let grandTotal = orderAmount + tipValue

            return grandTotal
    }
    
    
    var body: some View {
        NavigationView{
        Form {
            Section {
            TextField("Amount", text: $checkAmount)
                .keyboardType(.decimalPad)
                TextField("People", text: $numberOfPeople)
                .keyboardType(.decimalPad)
                    //Picker("Number of people", selection: $numberOfPeople) {
                    //    ForEach(2 ..< 100) {
                    //        Text("\($0) people")
                    //    }
                    //}
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    } .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson > 0 ? totalPerPerson : 0, specifier: "%.2f")")
                }
                
                Section(header: Text("Total amount for check - original + tip")) {
                    Text("$\(totalAmount, specifier: "%.2f")")
                        .foregroundColor(zero ? .red : .white)
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
