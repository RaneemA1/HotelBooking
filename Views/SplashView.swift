//
//  Logo.swift
//  HotelBooking
//
//  Created by ٍٍRaneem A on 07/05/1445 AH.
//

import SwiftUI

struct SplashView: View {
    
    @Binding var didSplash: Bool
    
    var body: some View {
            
            ZStack {
                
                Color.blue2
                    .edgesIgnoringSafeArea(.all)
   
                
                HStack(spacing: 4.0){
                    Image(systemName: "m.circle.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    
                    Text("MrHotel")
                        .font(.title2)
   
                        .foregroundColor(.white)
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    
                    
                }
                .onAppear {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                        
                        withAnimation {
                            
                            self.didSplash = true
                            
                            
                        }
                    }
                }
        }
    }
}
    #Preview {
        SplashView(didSplash: .constant(false))
    }

