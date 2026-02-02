//
//  PodcastsScreen.swift
//  TopShelf
//
//  Created by Hemal Swarnasiri on 2026-02-02.
//

import SwiftUI

struct PodcastsScreen: View {
  let pricing: PricingType
  
  let onSelectPodcast: (Podcast) -> Void
  
  private let podcasts: [Podcast] = [
    Podcast(id: 1, name: "Podcast 1"),
    Podcast(id: 2, name: "Podcast 2")
  ]
  
  init(
    pricing: PricingType,
    onSelectPodcast: @escaping (Podcast) -> Void = { _ in }
  ) {
    self.pricing = pricing
    self.onSelectPodcast = onSelectPodcast
  }
  
  var body: some View {
    List(podcasts) { podcast in
      Button {
        onSelectPodcast(podcast)
      } label: {
        HStack {
          Text(podcast.name)
          Spacer()
        }
      }
    }
    .navigationTitle("Podcasts")
  }
}


#Preview {
  PodcastsScreen(pricing: PricingType.free)
}
