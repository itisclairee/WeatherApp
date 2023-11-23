//
//  LoadingView.swift
//  Weather
//
//  Created by Chiara Cangelosi on 15/11/23.
//

import SwiftUI

struct LoadingView: View 
{
    var body: some View 
    {
        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white)).frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    LoadingView()
}
