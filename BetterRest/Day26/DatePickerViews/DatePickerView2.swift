//  DatePickerView2.swift
// SOURCE : https://www.hackingwithswift.com/books/ios-swiftui/selecting-dates-and-times-with-datepicker

import SwiftUI



struct DatePickerView2: View {
    
    @State private var wakeUpDate: Date = Date()
    
    
    
    var body: some View {
        
        Form {
            DatePicker("Wake up alarm :" , selection : $wakeUpDate)
        }
    }
}





struct DatePickerView2_Previews: PreviewProvider {
    
    static var previews: some View {
        
        DatePickerView2().previewDevice("iPhone 12 Pro")
    }
}
