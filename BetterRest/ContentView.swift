// MARK: ContentView.swift
// SOURCE : https://www.hackingwithswift.com/books/ios-swiftui/building-a-basic-layout

import SwiftUI



struct ContentView: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @State private var wakeUpTime: Date = Date()
    @State private var sleepAmount: Double = 8.00
    @State private var coffeeAmount: Int = 0
    
    
    
     // /////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("— Wake Up Time —")
                    .font(.headline)
                DatePicker("I would like to wake up at :" ,
                           selection : $wakeUpTime ,
                           displayedComponents : .hourAndMinute)
                Text("— Desired Amount of Sleep —")
                    .font(.headline)
                Stepper(value : $sleepAmount ,
                        in : 4...12 ,
                        step : 0.25) {
                    Text("I need \(sleepAmount , specifier: "%g") hours of sleep 🛌")
                }
                Text("— Daily Coffee Intake —")
                    .font(.headline)
                Stepper(value : $coffeeAmount ,
                        in : 0...20 ,
                        step : 1 ) {
                    Text("Today I had \(coffeeAmount) \(coffeeAmount == 1 ? "cup" : "cups") of coffee ☕️")
                }
            }
            .padding()
            .navigationBarTitle(Text("Better Rest"))
            /**
             `NOTE`: If we add the parentheses after `calculateBedtime`
             it means _call calculateBedtime()_
             and it will send back to the correct function to use
             when the button is tapped .
             So , Swift would require that `calculateBedtime()` returns a closure to run .
             By writing `calculateBedtime` rather than `calculateBedtime()`
             we are telling Swift to run that method when the button is tapped , and nothing more ;
             it won’t return anything that should then be run .
             */
            .navigationBarItems(trailing : Button(action : calculateBedtime , label : {
                Text("Calculate Bedtime")
            }))
        }
    }
    
    
     // ////////////////////
    //  MARK: HELPERMETHODS
    
    func calculateBedtime() {}
}





 // ///////////////
//  MARK: PREVIEWS

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView().previewDevice("iPhone 12 Pro")
    }
}
