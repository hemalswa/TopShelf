# TopShelf
Designing Production-Ready Navigation in SwiftUI Using NavigationStack

This project is associated with the following blog post: <br> [https://medium.com/@hemalasanka/designing-production-ready-navigation-in-swiftui-using-navigationstack-9e96aa8d0473](https://medium.com/@hemalasanka/designing-production-ready-navigation-in-swiftui-using-navigationstack-9e96aa8d0473)

# Demo Application Overview
This is the overview of this application

1. The user starts on a root screen, where they choose a pricing filter (Free or Paid) and select either Books or Podcasts.
2. Based on that selection, the app navigates to a list screen showing the relevant items.
3. Selecting an item from the list opens a detail screen.
4. From the detail screen, the user can return directly to the root view.
5. The current navigation state is persisted so the app can restore the last screen when relaunched.
   
The following diagram shows the screen navigation flow for the demo application.

<img width="3456" height="2941" alt="Navigation Blog flow" src="https://github.com/user-attachments/assets/66585329-b72d-4917-bbe4-2ef602e18aa1" />


The project was written using Xcode 26.2.



