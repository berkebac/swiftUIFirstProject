//
//  ContentView.swift
//  swiftUIFirstProject
//
//  Created by Berke Baç on 16.06.2022.
//

import SwiftUI

struct ContentView: View {
    @State var fahrenheitValue: String = "212"
    
    let numberFormatter : NumberFormatter = {
       
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }()
    
    func convertToCelsius() -> String {
        if let value = Double(fahrenheitValue) {
        
            let fahrenheit = Measurement<UnitTemperature>(value: value, unit: .fahrenheit)
            let celciusValue = fahrenheit.converted(to: .celsius)
            
            return numberFormatter.string(from: NSNumber(value: celciusValue.value)) ?? "???"
        }else {
            return "???"
        }
    }
    
    var body: some View {
        VStack{
            TextField("value", text: $fahrenheitValue)
                .keyboardType(.decimalPad)
                .font(Font.system(size: 64.0))
                .multilineTextAlignment(.center)
            Text("fahrenheit")
            Text("is actullay")
                .foregroundColor(.gray)
            Text(convertToCelsius())
                .font(Font.system(size: 64.0))
            Text("degrees Celcius")
            Spacer()
        }
        .foregroundColor(.orange)
        .font(.title)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
