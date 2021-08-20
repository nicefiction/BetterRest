// MARK: ContentView.swift
// SOURCE : https://www.hackingwithswift.com/books/ios-swiftui/building-a-basic-layout

// MARK: - LIBRARIES -

import SwiftUI



struct ContentView: View {
    
     // MARK: - PROPERTY WRAPPERS
    
    @State private var wakeUpTime: Date = defaultWakeUpTime
    @State private var sleepAmount: Double = 8.00
    @State private var coffeeAmount: Int = 0
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @State private var isShowingAlert: Bool = false
    
    
    
     // MARK: - COMPUTED PROPERTIES
    
    static var defaultWakeUpTime: Date {
        
        var dateComponents = DateComponents()
        dateComponents.hour = 7
        dateComponents.minute = 0
        // Converts those components into a full date :
        return Calendar.current.date(from : dateComponents) ?? Date()
    }
    
    
    var body: some View {
        
        return NavigationView {
            Form {
                Section(header : Text("Wake Up Time")) {
                // VStack(alignment: .leading) {
                    // Text("Wake Up Time")
                        // .font(.headline)
                    DatePicker("I would like to wake up at :" ,
                               selection : $wakeUpTime ,
                               displayedComponents : .hourAndMinute)
                }
                
                Section(header : Text("Desired Amount of Sleep")) {
                // VStack(alignment: .leading) {
                    // Text("Desired Amount of Sleep")
                        // .font(.headline)
                    Stepper(value : $sleepAmount ,
                            in : 4...12 ,
                            step : 0.25) {
                        Text("I need \(sleepAmount , specifier: "%g") hours of sleep 🛌")
                    }
                    .accessibility(value: Text("\(sleepAmount , specifier: "%g") hours of sleep"))
                }
                Section(header : Text("Daily Coffee Intake")) {
                // VStack(alignment : .leading) {
                    // Text("Daily Coffee Intake")
                        // .font(.headline)
                    Stepper(value : $coffeeAmount ,
                            in : 0...20 ,
                            step : 1 ) {
                        Text("\(coffeeAmount) \(coffeeAmount == 1 ? "cup" : "cups") of coffee ☕️")
                    }
                    .accessibility(value: Text("\(coffeeAmount) \(coffeeAmount == 1 ? "cup" : "cups") of coffee"))
                }
                
                Section(header : Text("Daily Coffee Intake")) {
                    Picker(selection : $coffeeAmount ,
                           label : Text("\(coffeeAmount) \(coffeeAmount == 1 ? "cup" : "cups") of coffee ☕️")) {
                        ForEach(0..<21) { (number: Int) in
                            Text("\(number)")
                        }
                    }
                    .accessibility(value: Text("\(coffeeAmount) \(coffeeAmount == 1 ? "cup" : "cups") of coffee"))
                }
                
                Section(header : Text("Your Recommended Bedtime")) {
                    HStack {
                        Spacer()
                        Text(calculatedBedtime)  // DAY 28 : CHALLENGE 3
                        // Text(calculateBedtime()) // DAY 28 : CHALLENGE 3
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                    }
                    .padding(.vertical)
                }
            }
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
//            .navigationBarItems(trailing : Button(action : calculateBedtime , label : {
//                Text("Calculate Bedtime")
//            }))
//            .alert(isPresented: $isShowingAlert) {
//                Alert(title : Text(alertTitle) ,
//                      message : Text(alertMessage) ,
//                      dismissButton : .default(Text("OK")))
//            }
        }
    }
    
    
     // MARK: - HELPERMETHODS
    
    /// DAY 28 : CHALLENGE 3
    var calculatedBedtime: String {
    // func calculateBedtime()
    // -> String {
        /// STEP 1 •  create an instance of the SleepCalculator class :
        let sleepCalculatorModel = SleepCalculator()
        
        /// STEP 2 • Store the individual parts of a date as separate values :
        let components =
            Calendar.current.dateComponents([.hour , .minute] ,
                                            from : wakeUpTime)
        let hourInSeconds = (components.hour ?? 0) * 60 * 60
        let minuteInSeconds = (components.minute ?? 0) * 60
        
        /// STEP 3 • Feed our values into Core ML and see what comes out :
        do {
            let sleepPrediction =
                try sleepCalculatorModel.prediction(
                    // STEP 4 • Calculate the wake time :
                    wake : Double(hourInSeconds + minuteInSeconds) ,
                    estimatedSleep : sleepAmount ,
                    coffee : Double(coffeeAmount)
                )
            
            /// STEP 5 • Convert the sleep prediction to the time they should go to bed :
            let sleepTime = wakeUpTime - sleepPrediction.actualSleep
            
            /// STEP 6 • Convert the date to a String using DateFormatter() :
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = .short
            // alertTitle = "Your ideal bedtime is ..."
            // alertMessage = dateFormatter.string(from : sleepTime)
            return dateFormatter.string(from : sleepTime) // DAY 28 : CHALLENGE 3
            
        } catch {
            // alertTitle = "Error"
            // alertMessage = "There was an error calculating your bedtime ."
            return "There was an error calculating your bedtime ."  // DAY 28 : CHALLENGE 3
        }
        
        
        // isShowingAlert = true
    }
}





 // MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView().previewDevice("iPhone 12 Pro")
    }
}
