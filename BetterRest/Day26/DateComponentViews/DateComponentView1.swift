//  DateComponentView1.swift
// SOURCE : https://www.hackingwithswift.com/books/ios-swiftui/working-with-dates

import SwiftUI



/**
 `CHALLENGE 1`
 `Choosing a sensible default wake up time :`
 As you have seen , Swift gives us `Date` for working with dates ,
 and that encapsulates
 the year , month , date , hour , minute , second , timezone , and more .
 However , we don’t want to think about most of that
 – we want to say
 _give me an 8am wake up time , regardless of what day it is today_ .
 Swift has a slightly different type for that purpose , called `DateComponents` ,
 which lets us read or write specific parts of a date rather than the whole thing :
 */

struct DateComponentView1: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @State private var wakeUpDate: Date = Date()
    
    
    
    // //////////////////////////
   //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        // Creates a date that represents 8 AM today :
        let dateComponents = DateComponents(hour : 8 ,
                                            minute : 0)
        
        let date = Calendar.current.date(from : dateComponents) ?? Date()
        
        
        return Text("\(date)")
    }
}





struct DateComponentView1_Previews: PreviewProvider {
    
    static var previews: some View {
        
        DateComponentView1().previewDevice("iPhone 12 Pro")
    }
}
