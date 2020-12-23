//
//  ListOfReceipes.swift
//  Receipt reminder
//
//  Created by Georgios Loulakis on 29.11.20.
//

import SwiftUI

struct ListOfReceipes: View {
    var body: some View {
        VStack {
                   VStack(alignment: .leading) {
                    RecImage()
                       Text("Μοσχαράκι με φασόλια")
                           .font(.title)
                       HStack(alignment: .top) {
                           Text("Γιώργος Λουλάκης")
                               .font(.subheadline)
                           Spacer()
                           Text("Ηράκλειο Κρήτης")
                               .font(.subheadline)
                       }
                   }
                   .padding()
               }
    }
}

struct ListOfReceipes_Previews: PreviewProvider {
    static var previews: some View {
        ListOfReceipes()
    }
}

struct RecImage: View {
    var body: some View {
        Image("AvatarImage")
            .resizable()
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}
