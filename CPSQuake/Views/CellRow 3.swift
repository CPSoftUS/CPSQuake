//
//  CellRow.swift
//  CPSQuake
//
//  Created by Dan Uff on 6/17/20.
//  Copyright © 2020 Connecting People Software. All rights reserved.
//

import SwiftUI

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
            .bold()
              .font(.custom("Chalkduster", size: 30))
              .foregroundColor(.white)
              .font(.headline)
              .frame(width: 100, height: 100)
              .background(Color.green)
              .clipShape(Circle())
              .overlay(Circle().stroke(Color.gray, lineWidth: 1))
              .shadow(radius: 10)
            
            VStack {
            Text(data.properties.place)
            .bold()
              .font(.custom("Chalkboard", size: 20))
             // .foregroundColor(.black)
                            
              Text("Time : \(timeConverter(timeStamp: data.properties.time))" )
              .italic()
                .foregroundColor(.black)
                .background(Color.yellow)
                .font(.custom("Chalkboard", size: 15))
                .padding(.top, 2)
            
      
            }
            
            
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
