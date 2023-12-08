//
//  OnboardingView.swift
//  HotelBooking
//
//  Created by ٍٍRaneem A on 07/05/1445 AH.
//

import SwiftUI

struct OnboardingView: View {
    
    @StateObject private var vm =  OnboardingViewViewModel()
    @Binding var didOnboard: Bool
  
    
    var body: some View {
       
        ZStack{
            
            TabView(selection: $vm.selectedTab) {
                
                onboardingItem(image: "img1", title: "Easy way to book hotels with us " ,text: "It is a long established fact that a reader will be distracted by the readable content.")
                    .tag(0)
                onboardingItem(image: "img2", title: "Discover and find your perfect healing place ",text: "It is a long established fact that a reader will be distracted by the readable content. ")
                    .tag(1)
                finalOnboardingItem(image: "img3", title: "Giving the best deal just for you",text:"It is a long established fact that a reader will be distracted by the readable content.")
                    .tag(2)
            }
            
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .never))
            .ignoresSafeArea()
        }
        
    }
    
    @ViewBuilder
    private func finalOnboardingItem(image: String, title: LocalizedStringKey, text: LocalizedStringKey) -> some View {
        VStack {
            GeometryReader { x in
                VStack(spacing: 30.0) {
                    Image(image)
                        .resizable()
                        .ignoresSafeArea()
                        .aspectRatio(contentMode: .fill)
                        .padding(.bottom)
                }
            }
            VStack{
                
                VStack{
                    
                    Text(title)
                        .frame(width: 300, height: 100)
                        .multilineTextAlignment(.leading)
                        .font(.title)
                        .bold()
                    
                    Text(text)
                        .foregroundColor(Color.gray)
                }
                HStack {
                    Spacer()
                }.padding(.trailing)
                    .padding(.trailing)
                HStack{
                    
                    Button(action: {
                        withAnimation {
                            didOnboard.toggle()
                        }
                        
                    }) {
                        HStack{
                            Text("Get Started")
                                .foregroundColor(Color.white)
                                .padding(.leading)
                            Image(systemName: "arrow.right")
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color.white)
                                .flipsForRightToLeftLayoutDirection(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            
                        }
                        .frame(maxWidth : .infinity)
                        .background(Color.blue2)
                        .clipShape(Rectangle())
                        .cornerRadius(8)
                    }
                }.padding()
                
            }
            .background(Rectangle()
                .foregroundColor(Color.white)
                .frame(width: 400, height: 330)
                .cornerRadius(30)
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
            )
            
        }
    }
    
    @ViewBuilder
    private func onboardingItem(image: String, title: LocalizedStringKey, text: LocalizedStringKey) -> some View {
        VStack {
            GeometryReader { x in
                VStack(spacing: 30.0) {
                    Image(image)
                        .resizable()
                        .ignoresSafeArea()
                        .aspectRatio(contentMode: .fill)
                        .padding(.bottom)
                }
            }
            VStack{
                
                VStack{
                    
                    Text(title)
                        .frame(width: 300, height: 100)
                        .multilineTextAlignment(.leading)
                        .font(.title)
                        .bold()
                    
                    Text(text)
                        .foregroundColor(Color.gray)
                }
                HStack {
                    Spacer()
                }.padding(.trailing)
                    .padding(.trailing)
                HStack{
                    
                    HStack{
                        
                        Button(action: {
                            withAnimation {
                                didOnboard.toggle()
                            }
                        }, label: {
                            Text("Skip")
                                .bold()
                                .foregroundColor(Color.black)
                            
                            
                        })
                       
                        
                        
                        
                    }
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            if vm.selectedTab == 2 {
                            
                            } else {
                                vm.selectedTab += 1
                            }
                        }
                        
                    }) {
                        HStack{
                            Text("Next")
                                .foregroundColor(Color.white)
                                .padding(.leading)
                            Image(systemName: "arrow.right")
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color.white)
                                .flipsForRightToLeftLayoutDirection(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            
                            
                        } .background(Color.blue2)
                            .clipShape(Rectangle())
                            .cornerRadius(8)
                    }
                }.padding()
                
            }
            .background(Rectangle()
                .foregroundColor(Color.white)
                .frame(width: 400, height: 330)
                .cornerRadius(30)
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
            )
            
        }
    }
}

#Preview {
    OnboardingView(didOnboard: .constant(false))
}

