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
                VStack (alignment: .center, spacing: 2){
                    Spacer()
                        .frame(height: 60)
                    Text(author)
                        .bold()
                        .font(.system(size: 46))
                    Text(quote)
                        .fontWeight(.semibold)
                        .font(.system(size: 18))
                        .frame(width: 320, height: 90)
                        .padding()
                }
                
                getImage(pourcent: pourcent)
                Spacer()
                    .frame(height: 13)
                HStack (alignment: .firstTextBaseline) {
                    Text("\(String(Int(round(pourcent)))) %")
                        .font(.system(size: 35))
                        .foregroundColor(Color.textColor)
                    Text("de citations")
                        .foregroundColor(Color.textColor)
                        .font(.system(size: 20))
                }
                .padding()
                VStack {
                    HStack {
                        Text("Votre progression")
                            .foregroundColor(Color.textColor)
                            .padding()
                        Spacer()
                    }
                    Spacer()
                    
                    VStack (spacing: -23){
                        HStack (spacing: 2){
                            Slider(value: $pourcent, in: 0...100, minimumValueLabel: Image(""),
                                   maximumValueLabel: Image("Picto etoile")
                                   , label: {
                                Text("Label")
                            })
                            .accentColor(Color.sliderColor)
                            .allowsHitTesting(false)
                            .padding()
                            
                        }
                        HStack {
                            Spacer()
                            Text("26 citations")
                                .foregroundColor(Color.textColor)
                                .font(.system(size: 12))
                                .padding()
                        }
                    }
                }
                Button(action: { currentIndex += 1 }) {
                    Text("Citations suivante")
                        .foregroundColor(Color.white)
                        .padding()
                }
                .frame(width: 178, height: 33)
                .background(Color.buttonColor)
                .clipShape(Capsule())
                .padding()
                Spacer()
                    .frame(height: 220)
            }
            
            .alert(isPresented:$showingAlert) {
                Alert(
                    title: Text("Tu es à 50% des citations"),
                    message: Text("Tu as bientôt fini!"),
                    primaryButton: .cancel(Text("Continuer !")),
                    secondaryButton: .default(Text("Arrêter")){
                        displaySucces = true }
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






