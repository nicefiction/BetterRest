// MARK: ContentView.swift
// SOURCE : https://www.hackingwithswift.com/books/ios-swiftui/building-a-basic-layout

import SwiftUI



struct ContentView: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @State private var wakeUpTime: Date = defaultWakeUpTime
    @State private var sleepAmount: Double = 8.00
    @State private var coffeeAmount: Int = 0
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @State private var isShowingAlert: Bool = false
    
    
    
     // /////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    static var defaultWakeUpTime: Date {
        
        var dateComponents = DateComponents()
        dateComponents.hour = 7
        dateComponents.minute = 0
        // Converts those components into a full date :
        return Calendar.current.date(from : dateComponents) ?? Date()
    }
    
    
    var body: some View {
        
        NavigationView {
            Form {
                VStack(alignment: .leading) {
                    Text("Wake Up Time")
                        .font(.headline)
                    DatePicker("I would like to wake up at :" ,
                               selection : $wakeUpTime ,
                               displayedComponents : .hourAndMinute)
                }
                
                VStack(alignment: .leading) {
                    Text("Desired Amount of Sleep")
                        .font(.headline)
                    Stepper(value : $sleepAmount ,
                            in : 4...12 ,
                            step : 0.25) {
                        Text("I need \(sleepAmount , specifier: "%g") hours of sleep 🛌")
                    }
                }
                
                VStack(alignment : .leading) {
                    Text("Daily Coffee Intake")
                        .font(.headline)
                    Stepper(value : $coffeeAmount ,
                            in : 0...20 ,
                            step : 1 ) {
                        Text("Today I had \(coffeeAmount) \(coffeeAmount == 1 ? "cup" : "cups") of coffee ☕️")
                    }
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
            .navigationBarItems(trailing : Button(action : calculateBedtime , label : {
                Text("Calculate Bedtime")
            }))
            .alert(isPresented: $isShowingAlert) {
                Alert(title : Text(alertTitle) ,
                      message : Text(alertMessage) ,
                      dismissButton : .default(Text("OK")))
            }
        }
    }
    
    
     // ////////////////////
    //  MARK: HELPERMETHODS
    
    func calculateBedtime() {
        // STEP 1 •  create an instance of the SleepCalculator class :
        let sleepCalculatorModel = SleepCalculator()
        
        // STEP 2 • Calculate the wake time :
        let dateComponents =
            Calendar.current.dateComponents([.hour , .minute],
                                            from : wakeUpTime)
        let hourInSeconds = (dateComponents.hour ?? 0) * 60 * 60
        let minuteInSeconds = (dateComponents.minute ?? 0) * 60
        
        // STEP 3 • Feed our values into Core ML and see what comes out . This might fail if Core ML hits some sort of problem , so we need to use do and catch :
        do {
            let sleepPrediction =
                try sleepCalculatorModel.prediction(wake: Double(hourInSeconds + minuteInSeconds) ,
                                                    estimatedSleep : sleepAmount ,
                                                    coffee : Double(coffeeAmount))
            
            // STEP 4 • Convert the sleep prediction to the time they should go to bed :
            let sleepTime = wakeUpTime - sleepPrediction.actualSleep
            
            // STEP 5 • Show the bedtime in a human readable format to the user :
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = .short
            alertTitle = "Your ideal bedtime is ..."
            alertMessage = dateFormatter.string(from: sleepTime)
            
        } catch {
            alertTitle = "Error"
            alertMessage = "There was an error calculating your bedtime ."
        }
        
        
        isShowingAlert = true
        
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView().previewDevice("iPhone 12 Pro")
    }
}
