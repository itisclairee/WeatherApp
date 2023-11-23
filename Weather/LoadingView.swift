//
//  LoadingView.swift
//  Weather
//
//  Created by Chiara Cangelosi on 20/11/23.
//

import SwiftUI

struct LoadingView: View 
{
    var body: some View 
    {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .black.opacity(1)))
            .frame(maxWidth: .infinity, maxHeight: .infinity).accessibilityLabel("Loading View")
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
