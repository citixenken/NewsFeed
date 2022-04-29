//
//  ErrorView.swift
//  NewsFeed
//
//  Created by Ken Muyesu on 29/04/2022.
//

import SwiftUI

struct ErrorView: View {
    
    typealias ErrorViewActionHandler = () -> Void
    let error: Error
    let handler: ErrorViewActionHandler
    
    internal init(error: Error, handler: @escaping ErrorView.ErrorViewActionHandler) {
        self.error = error
        self.handler = handler
    }
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
                .font(.system(size: 90, weight: .heavy))
                .padding(.bottom, 4)
            Text("Error encountered!")
                .foregroundColor(.primary)
                .font(.system(size: 20, weight: .heavy))
                .multilineTextAlignment(.center)
            Text(error.localizedDescription)
                .foregroundColor(.secondary)
                .font(.system(size: 16))
                .multilineTextAlignment(.center)
                .padding(.vertical, 4)
            
            Button(action: {
                handler()
            }, label: {
                Text("Retry")
            })
                .padding(.vertical, 12)
                .padding(.horizontal, 30)
                .background(Color.blue)
                .foregroundColor(.white)
                .font(.system(size: 18, weight: .heavy))
                .cornerRadius(8)
        }
        
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.decodingError){}
    }
}
