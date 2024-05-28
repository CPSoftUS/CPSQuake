import SwiftUI
import UIKit

struct CellRow: View {
  
 var data: Features
  
    var body: some View {
 
      HStack(alignment: .center, spacing: 9)
      {
        VStack(alignment: .leading)
        {
        HStack
          {
         Text(String(data.properties.mag))
            .padding()
          .border(Color.white)
              .font(.custom("SF Pro Text", size: 30))
              .foregroundColor(.white)
              .frame(width: 100, height: 100)
              .background(Color.black)
                          
            
            if (data.properties.mag <= 1)
            {
              Image(systemName: "rectangle.fill")
              .resizable()
              .frame(width: 30, height: 30)
              .foregroundColor(Color.green)
            
            }else if (data.properties.mag >= 2)
            {
              Image(systemName: "rectangle.fill")
              .resizable()
              .frame(width: 30, height: 30)
              .foregroundColor(Color.yellow)
            
            }else if (data.properties.mag >= 3)
              {
                Image(systemName: "rectangle.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(Color.orange)
              
              
            }else if (data.properties.mag >= 4)
             {
               Image(systemName: "rectangle.fill")
               .resizable()
               .frame(width: 30, height: 30)
               .foregroundColor(Color.red)
               
            
              
            }else if (data.properties.mag >= 5)
            {
              Image(systemName: "rectangle.fill")
              .resizable()
              .frame(width: 50, height: 50)
                .foregroundColor(Color.purple)
            
            }else {
              
              Image(systemName: "rectangle.fill")
              .resizable()
              .frame(width: 30, height: 30)
              .foregroundColor(Color.green)
            }
            
           
            VStack(alignment: .leading) {
            Text(data.properties.place)
              .font(.custom("Chalkboard", size: 20))
                            
              Text("Time : \(timeConverter(timeStamp: data.properties.time))" )
              .italic()
                .foregroundColor(.white)
                .background(Color.black)
                .font(.custom("Chalkboard", size: 15))
                .padding(.top, 2)
            
      
            }
            
            
          }
          
        }
    
      }
      }
    

struct CellRow_Previews: PreviewProvider {
  static var previews: some View {
    /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
  }
}
}
