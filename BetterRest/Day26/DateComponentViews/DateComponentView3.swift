//  DateComponentView3.swift
// SOURCE : https://www.hackingwithswift.com/books/ios-swiftui/working-with-dates

import SwiftUI



/**
 `CHALLENGE 3`
 `Showing their suggested bedtime neatly formatted :`
 The last challenge is
 _how we can format dates and times_ ,
 and once again
 Swift gives us a specific type to do most of the work for us .
 This time it is called `DateFormatter` ,
 and it lets us convert a date into a string in a variety of ways .
 */

struct DateComponentView3: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @State private var wakeUpDate: Date = Date()
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        let dateString = dateFormatter.string(from : wakeUpDate)
        
        return VStack {
            Text("\(dateString)")
            DatePicker("Wake me up at :" ,
                       selection : $wakeUpDate ,
                       displayedComponents : .hourAndMinute)
                .labelsHidden()
        }
        .padding()
    }
}

/**
 `NOTE`: We could also set `.dateStyle` to get date values ,
 and even pass in an entirely custom format using `dateFormat` ,
 but that is way out of the remit of this project !
 */





struct DateComponentView3_Previews: PreviewProvider {
    
    static var previews: some View {
        
        DateComponentView3().previewDevice("iPhone 12 Pro")
    }
}
