# Some comments about the project.

I decided to use the Clean  swift arquitecture for development, using a customized (I change the indentation) templates of the Raymond Law popular free templates. ref: https://clean-swift.com/
I usually work with templates, because the team can work in the same playground without big differences between code from a several developers team. Also Seniors and arquitect can define the Scenes with the

It's a VIP pattern, basically the View controller send the user interactions to the Interactors, that use Workers to make hard works (network request, ddbb in/out). The Presenter by the ViewModels is able to show changes in the view.

It's a good way to code applying the S.O.L.I.D principles (As as you can) It allows to make unit tests trying to cover as much code as possible and allows enriching the tests, giving robustness to an application, notifying developers of collateral errors when adding changes or fixing bugs.

## App use.

Initially de app downloads the set of user that are shown in a horizontal collectionview of users.

If you try to select one of them the app makes a download of two different resources linked with the user selected. A list of Post and a list of Todo. The download is based on a Dispatch group more efficiently than synchronizing to different calls that.

You can click on one of the post to navigate to the comment list associated to post selected.


## How to improve the project.

### Project configuration.
    Multiple targets with multiple environments. Is mandatory to keep multiple targets with the several environments, different build versions, assets and with the same code to perform the team work:
        A example could be:   production, qa, develop and integration targets for different task and environments.

    i18n. I have created a simple localizable.strings file with all the project text, on this way we can translate in all the desired languages.
    
    I haven't include cocoapods or other framework version manager, If some third party libraries are needed in a project is the better way to get, install, and keep updated easily

### Networking:
    The networking layer is very basic and direct. We can improve it by adding Alamofire framework, that keeps pass request in cache, making faster next requesting to the same endpoint. Other improvement could be the Alamofire feature that can support priority queue. 

    The security of the API could be increased by adding login and privatizing some of the rest endpoints. The login could be keeping a session token with the server (the iOS client can keep the token in memory while the app is alive). The user must perform login in order to get a session token that should be sent in the private endpoints header request. Another kind of info could be included on the headers like the platform where the client is requesting or some kind of hash to difficult a man in de middle attack 

    Other kind of login could be oauth authenticating, that redirect the user to a pointed url when the user perform a right login to keep th session alive.

### UI/UX

    I haven't pay attention to the UI/UX of the app. Is a wireframe in the practice. It could have a better look and feel including:

    Spinning showing a background heavy process or Skeleton to show data downloading.

    Improve cells  of tables and collection views, look with round borders and shadow.

    Two state buttons with different background to show the hitting state 

### Unit test.

    I have made a simple layer of unit test trying to cover the protocol methods where I coded the logic and where I can spy the and heritage the miscellaneous classes to perform core test.

    We can improve this, adding code coverage to existing code with more test for the same methods taking care of the difference use cases, adding quality  by performing more asserting inside every unit test. 
******
