//
//  SuccessView.swift
//  MarmeladeApp
//
//  Created by Jason Dahmoun on 25/05/2022.
//

import SwiftUI

struct SuccessView: View {
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack {
                Rectangle()
                    .fill( LinearGradient(gradient: Gradient(colors: [Color.color1, Color.color2, Color.color3, Color.color4, Color.color5, Color.color6, Color.color7]),
                                          startPoint: .trailing,
                                          endPoint: .leading ))
                    .frame(height: 380)
                    .ignoresSafeArea(.all, edges: .top)
                Spacer()
            }
            VStack {
                Spacer()
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 480)
                    .cornerRadius(30)
                    .shadow(color: .gray, radius: 15, x: 0, y: -5)
                    .ignoresSafeArea()
            }
            VStack (alignment: .center){
                Image("smiley_awe")
                Spacer()
                Text("Félicitations vous y êtes arrivés !")
                    .foregroundColor(Color.textColor)
                    .font(.system(size: 20))
                    .bold()
                Spacer()
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
