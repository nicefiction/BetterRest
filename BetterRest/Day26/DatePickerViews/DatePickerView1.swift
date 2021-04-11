//  DatePickerView1.swift
// SOURCE : https://www.hackingwithswift.com/books/ios-swiftui/selecting-dates-and-times-with-datepicker

import SwiftUI



struct DatePickerView1: View {
    
    @State private var wakeUpDate: Date = Date()
    
    
    
    var body: some View {
        
        VStack {
            Spacer()
            DatePicker("Select a date" ,
                       selection: $wakeUpDate)
            Spacer()
            DatePicker("At what time do you want to wake up ?" ,
                       selection : $wakeUpDate)
                .labelsHidden()
            /**
             That still includes the original label
             so screen readers can use it for VoiceOver ,
             but now they aren’t visible onscreen any more
             – the date picker will take up all horizontal space on the screen .
             */
            Spacer()
        }
        .padding()
    }
}






struct DatePickerView1_Previews: PreviewProvider {
    
    static var previews: some View {
        
        DatePickerView1().previewDevice("iPhone 12 Pro")
    }
}
