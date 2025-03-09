<h1 align="center" id="title">ShowsList App</h1>

<h2>Project Screenshots:</h2>

<img src="https://github.com/user-attachments/assets/0185e84b-7556-44cf-af14-0189bf4d2cd3" alt="Loading-Page" width="400" height="850">
<img src="https://github.com/user-attachments/assets/c51cd516-30d7-4148-a79e-f5721b232f69" alt="Loading-Page" width="400" height="850">
<img src="https://github.com/user-attachments/assets/992ac744-ccb9-40cf-8660-f098bcc34670" alt="Loading-Page" width="400" height="850">
<img src="https://github.com/user-attachments/assets/a6ba3c4b-b5c4-4395-b84e-ea61acfca071" alt="Loading-Page" width="400" height="850">
<img src="https://github.com/user-attachments/assets/fab5ed7a-eaaa-4413-8d2b-c89df929417e" alt="Loading-Page" width="400" height="850">
<img src="https://github.com/user-attachments/assets/5d128875-63e1-4ac0-9cf6-c1b495e30a13" alt="Loading-Page" width="400" height="850">
  
<h2>🧐 Features</h2>

Features:

*   Shows List (Pagination and Search by Name)
*   Show Detail Page (with episodes, genres, Image and more)
*   Bottom Sheet Episodes Detail

<h2>🛠️ Instalation Guide:</h2>

<p>1. Git</p>

```
Clone this repository
```

<p>2. Xcode</p>

```
Run 'make project' on Terminal
```

<h2>💻 Built with</h2>

Tecnologias:

*   Swift
*   SwiftUI
*   Async Await
*   XCTest
*   MVVM-C
*   Factory
*   Fastlane
*   Modularization
*   SPM

Arquitetura:

- A layered architecture was used, initially consisting of **Domain, Commons, Networking, and Features**. In the **Features** layer, **MVVM-C** was implemented. Integration with the backend was done using **UseCases** and **URLSession**. I chose to use **MVVM-C** and a layered architecture to ensure greater **scalability** for the project, both in terms of adding new features and improving existing ones. The focus was always on **high maintainability and testability**.

<h2>📋 Backlog</h2>

- [x] Setup Xcode Project (completed)
- [x] Setup Base Project with Coordinator (completed)
- [x] Create Show List View (completed)
- [x] Create layers with modules SPM (completed)
- [x] Create Show Detail Screen (completed)
- [x] Create Episode Detail Screen (completed)
- [x] Fastlane lane to run tests (completed)
- [x] Makefile to run the project (completed)
- [ ] Create Favorites View
- [ ] Create Authentication BS to open main page
- [ ] UI Tests
- [ ] Fastlane to Deploy Testflight
- [ ] Modularization for each Feature
