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
    VStack {
      Text(podcast.name)
      Button("Go to Root view") {
        onGoToRoot()
      }
    }
  }
}


#Preview {
  PodcastDetailsScreen(podcast: Podcast(id: 1, name: "PodCast1"))
}
