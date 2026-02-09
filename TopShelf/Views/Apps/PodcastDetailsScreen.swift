//
//  PodcastDetailsScreen.swift
//  TopShelf
//
//  Created by Hemal Swarnasiri on 2026-02-02.
//

import SwiftUI

struct PodcastDetailsScreen: View {
  let podcast: Podcast
  
  let onGoToRoot: () -> Void
  
  init(
    podcast: Podcast,
    onGoToRoot: @escaping () -> Void = { }
  ) {
    self.podcast = podcast
    self.onGoToRoot = onGoToRoot
  }
  
  var body: some View {
      VStack(spacing: 24) {

          VStack(spacing: 12) {
              Image(systemName: "mic.fill")
                  .font(.system(size: 48))
                  .foregroundColor(.accentColor)

              Text(podcast.name)
                  .font(.title)
                  .fontWeight(.semibold)
          }
          .padding()
          .frame(maxWidth: .infinity)
          .background(
              RoundedRectangle(cornerRadius: 16)
                  .fill(Color(.systemBackground))
                  .shadow(radius: 4)
          )
          Spacer()
      }
      .padding(.top, 24)
      .padding(.horizontal)
      .navigationTitle("Podcast Details")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
              Button {
                  onGoToRoot()
              } label: {
                  Image(systemName: "house.fill")
              }
          }
      }
  }
}


#Preview {
  PodcastDetailsScreen(podcast: Podcast(id: 1, name: "PodCast1"))
}
