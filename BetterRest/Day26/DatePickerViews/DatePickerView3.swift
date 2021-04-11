//  DatePickerView3.swift
// SOURCE : https://www.hackingwithswift.com/books/ios-swiftui/selecting-dates-and-times-with-datepicker

import SwiftUI



struct DatePickerView3: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @State private var wakeUpDate: Date = Date()
    
    
    
     // /////////////////
    //  MARK: PROPERTIES
    
    /**
     When you create a new Date instance
     it will be set to the current date and time :
     */
    let now: Date = Date()
    /**
     Creates a second Date instance
     set to one day in seconds from now :
     */
    let tomorrow: Date = Date().addingTimeInterval(86_400)
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        VStack {
            DatePicker("When do you want to wake up ?" ,
                       selection : $wakeUpDate ,
                       displayedComponents : .hourAndMinute)
            DatePicker("When do you want to wake up ?" ,
                       selection : $wakeUpDate ,
                       displayedComponents : .date)
            DatePicker("When do you want to wake up ?" ,
                       selection : $wakeUpDate ,
                       in : now...tomorrow)
            /**
             Swift lets us form one-sided ranges
             – ranges where we specify either the start or end but not both ,
             leaving Swift to infer the other side .
             */
            DatePicker("Wake me up at" ,
                       selection : $wakeUpDate ,
                       in : now...)
            /**
             That will allow all dates in the future , but none in the past
             – read it as _from the current date up to anything_ .
             */
        }
        .padding()
        .labelsHidden()
    }
}





struct DatePickerView3_Previews: PreviewProvider {
    
    static var previews: some View {
        
        DatePickerView3().previewDevice("iPhone 12 Pro")
    }
}
