//
//  ImageDisplayView.swift
//  NewsApp
//
//  Created by kurupareshan pathmanathan on 7/30/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageDisplayView: View {
    
    let url: URL?
    var isCircular: Bool = true
    var height: CGFloat
    var width: CGFloat
    
    var body: some View {
        if isCircular {
            WebImage(url: url)
                .placeholder {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 60, height: 60)
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
        } else {
            WebImage(url: url)
                .placeholder {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: width, height: height)
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width, height: height)
                .clipShape(Rectangle())
        }
    }
}

struct ImageDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        ImageDisplayView(url: URL(string: "https://via.placeholder.com/150"), height: 200, width: 200)
    }
}
