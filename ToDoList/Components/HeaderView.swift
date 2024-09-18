//
//  HeaderView.swift
//  ToDoList
//
//  Created by Mohit Khandal on 23/05/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subTitle :String
    let angle : Double
    let backgroundColor : Color
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0).foregroundColor(backgroundColor)
                .rotationEffect(Angle(degrees: angle))
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                Text(subTitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }.padding(.top, 80)
            
        }.frame(width: UIScreen.main.bounds.width  * 3, height: 350)
            .offset(y: -150)
    }
}


struct HeaderView_Preview: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", subTitle: "SubTitle", angle: 15, backgroundColor: .blue)
    }
}

