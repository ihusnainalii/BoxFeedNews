
![cover](https://github.com/ihusnainalii/BoxFeedNews/assets/41187664/e5d621ac-ba3d-442a-a6db-6a99c400eb21)

# Box Feed
News App 📱 built to demonstrate the use of following features,

- SwiftUI
  - Async/Await 
  - AsyncImage
  - List
    - Refreshable
    - Swipe Actions
    - Separator
    - Pagination
- Core Data
- MVVM Architecture Pattern

*Made with love ❤️*

<br />

## Screenshots
<table>
        <tr>
            <th>Home</th>
            <th>News Detail</th>
        </tr>
        <tr>
            <td><img src="https://github.com/ihusnainalii/BoxFeedNews/assets/41187664/6a98da7a-d9db-40be-af3f-909175a97c55" alt="Home"></td>
            <td><img src="https://github.com/ihusnainalii/BoxFeedNews/assets/41187664/f33b653d-5405-489a-a219-84a317858cb0" alt="News Detail"></td>
        </tr>
        <tr>
            <th>Bookmark</th>
            <th>Bookmark Detail</th>
        </tr>
        <tr>
            <td><img src="https://github.com/ihusnainalii/BoxFeedNews/assets/41187664/f55b2e47-8a5c-4972-8ed0-ca6a11be7469" alt="Bookmark"></td>
            <td><img src="https://github.com/ihusnainalii/BoxFeedNews/assets/41187664/20fcc580-2a29-45db-857d-8c52eb7ac6ab" alt="Bookmark Detail"></td>
        </tr>
    </table>

<br />

## Note
Once you clone the repo,
- Add your own API key from [News API](https://newsapi.org) in [AppConfig file]
- Checkout your current plan. The [News API](https://newsapi.org) has limit for developer plan on dates query and content chars

<br />

## Built With 🛠
- [SwiftUI](https://developer.apple.com/documentation/swiftui/) - SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift.
- [CoreData](https://developer.apple.com/documentation/coredata) - Framework used to manage the model layer objects in the application.
- [Figma](https://figma.com/) - Figma is a vector graphics editor and prototyping tool which is primarily web-based.

<br />

## Project Structure
    
    BoxFeed # Target
    |
    ├── Resources
    |
    ├── Library
    |   ├── CoreData            # CoreData ManagedObject
    |   ├── Helpers             # All extension functions + CustomViews
    |   ├── Models              # Decodable models
    |   ├── Services            # NewsService
    |
    ├── Screens
    |   |
    |   ├── view
    |   │   ├── main                    # Main root folder
    |   |   │   ├── view                # SwiftUI MainView
    |   |   │   └── viewmodel           # ViewModel for MainView
    |   │   ├── Home                    # Home root folder
    |   |   |   |__ Home                # Home
    |   │   ├── Article                 # Article root folder
    |   |   |   |__ Article             # Article
    |   │   ├── Bookmarks               # Bookmarks root folder
    |   |   |   |__ Bookmarks           # Bookmarks
    |

<br />
<br />

## License
```
    Apache 2.0 License


    Copyright 2021 Sameer Nawaz

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

```
