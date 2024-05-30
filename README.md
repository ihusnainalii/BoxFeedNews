
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
        <th>Bookmark</th>
    </tr>
    <tr>
        <td><img src="https://github.com/ihusnainalii/BoxFeedNews/assets/41187664/7ec2d80b-1c80-40b4-9928-c2bdc9d278ef" alt="Home"></td>
        <td><img src="https://github.com/ihusnainalii/BoxFeedNews/assets/41187664/afef4ebd-06e1-4554-9b4a-5703adefc667" alt="News Detail"></td>
        <td><img src="https://github.com/ihusnainalii/BoxFeedNews/assets/41187664/04856440-acc6-4cb2-b5d9-42d43c853be9" alt="Bookmark"></td>
    </tr>
    <tr>
        <td><img src="https://github.com/ihusnainalii/BoxFeedNews/assets/41187664/457b975f-f770-42bb-ae0a-8529748cde38" alt="Home"></td>
        <td><img src="https://github.com/ihusnainalii/BoxFeedNews/assets/41187664/93c10523-8813-46d7-b5c9-dfb9d6b8ef07" alt="News Detail"></td>
        <td><img src="https://github.com/ihusnainalii/BoxFeedNews/assets/41187664/6e2c7dcc-3b20-4215-9a0e-97809a431155" alt="Bookmark"></td>
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


    Copyright 2024 Husnain Ali

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
