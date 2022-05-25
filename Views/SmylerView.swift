//
//  SmylerView.swift
//  MarmeladeApp
//
//  Created by Jason Dahmoun on 25/05/2022.
//

import SwiftUI

struct SmylerView: View {
    
    var author: String
    var quote: String
    @State private var displaySucces = false
    @State private var showingAlert = false
    @State var pourcent = 0.0
    @Binding var currentIndex: Int  {
        didSet {
            onCurrentIndexChange()
        }
    }
    var totalCount: Int
    var body: some View {
        ZStack {
            NavigationLink(destination: SuccessView(), isActive: $displaySucces, label: {EmptyView()})
            VStack (){
                VStack (alignment: .center, spacing: 13){
                Text(author)
                    .bold()
                    .font(.system(size: 50))
                    Text(quote)
                    .frame(width: 315, height: 22, alignment: .center)
                }
                Spacer()
                getImage(pourcent: pourcent)
                HStack (alignment: .firstTextBaseline) {
                    Text("\(String(Int(round(pourcent)))) %")
                        .font(.system(size: 55))
                    Text("de citations")
                        .font(.system(size: 20))
                }
                .padding()
                Slider(value: $pourcent, in: 0...100)
                    .allowsHitTesting(false)
                    .padding()
                Button(action: { currentIndex += 1 }) {
                    Text("Citations suivante")
                        .foregroundColor(Color.white)
                        .padding()
                }
                    .frame(width: 178, height: 33)
                    .background(Color.purple)
                    .clipShape(Capsule())
                    .padding()
                Spacer()
            }
            
            .alert(isPresented:$showingAlert) {
                Alert(
                    title: Text("Tu es à 50% des citations"),
                    message: Text("Tu as bientôt fini!"),
                    primaryButton: .default(Text("Arrêter")){
                        displaySucces = true } ,
                    secondaryButton: .cancel(Text("Continuer !"))
                )
            }
        }
    }
    private func onCurrentIndexChange() {
        pourcent =  Double(currentIndex) / Double(totalCount) * 100
        if Int(round(Double(totalCount)) / 2) == currentIndex {
            DisplayAlert()
        }
    }
    private func getImage(pourcent: CGFloat) ->Image {
        switch pourcent {
        case 0...39:
            return Image("smiley_awe")
        case 40...79.9:
            return Image("smiley_meh")
        case 80...100:
            return Image("smiley_awe")
        default:
            return Image(systemName: "")
        }
        
    }
    private func DisplayAlert() {
        showingAlert = true
    }
}






