// MARK: DateComponentView2.swift
// SOURCE : https://www.hackingwithswift.com/books/ios-swiftui/working-with-dates

import SwiftUI



/**
 `CHALLENGE 2`
 `Reading the hour and minute they want to wake up :`
 The second challenge is
 _how we could read the hour they want to wake up_ .
 Remember , `DatePicker `is bound to a `Date`
 giving us lots of information ,
 so we need to find a way to pull out
 just the hour and minute components .
 Again , `DateComponents` comes to the rescue :
 we can ask iOS to provide specific components from a date ,
 then read those back out :
 */

struct DateComponentView2: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @State private var wakeUpDate: Date = Date()
    
    
    
     // /////////////////
    //  MARK: PROPERTIES
    
    let tomorrow = Date().addingTimeInterval(86_400)
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        let dateComponents =
            Calendar.current.dateComponents([.hour , .minute] ,
                                            from : Date() ,
                                            to : tomorrow)
        
        let dateHour = dateComponents.hour ?? 0
        let dateMinutes = dateComponents.minute ?? 0
        
        
        return VStack {
            Text("\(dateComponents)")
            Spacer()
            Text("\(dateHour) : \(dateMinutes)")
            DatePicker("Wake me up at :" ,
                       selection: $wakeUpDate ,
                       displayedComponents : .hourAndMinute)
            Spacer()
        }
        .padding()
    }
}





struct DateComponentView2_Previews: PreviewProvider {
    
    static var previews: some View {
        
        DateComponentView2()
    }
}
