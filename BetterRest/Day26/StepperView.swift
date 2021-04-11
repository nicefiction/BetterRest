//  StepperView.swift
// SOURCE : https://www.hackingwithswift.com/books/ios-swiftui/entering-numbers-with-stepper

import SwiftUI



struct StepperView: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @State private var amountOfSleep: Double = 8
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        Stepper(value : $amountOfSleep ,
                in : 4...12 ,
                step : 0.25) {
            Text("Sleep amount : \(amountOfSleep , specifier: "%g") hours")
            /**
             The `“%g”` specifier automatically removes
             insignificant zeroes from the end of the number .
             */
        }
        .padding()
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct StepperView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        StepperView().previewDevice("iPhone 12 Pro")
    }
}
