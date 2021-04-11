// MARK: ContentView.swift

import SwiftUI



struct ContentView: View {
    
     // /////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        Text("Hello, world!")
            .padding()
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView().previewDevice("iPhone 12 Pro")
    }
}
