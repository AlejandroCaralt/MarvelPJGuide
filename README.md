# MarvelPJGuide
The **MarvelPJGuide** app allows the user to navigate through all the characters from Marvel´s universe, and see every detail of their favourite characters.

The list loads a maximun of 20 characters at the same time, when the user scrolls down to bottom, it starts to load the next 20 characters available.
By tapping the on the character image, it popups an entire screen size view, containing the detailed information of the characted tapped.
When the character has some of the information empty or undefined, views containing that information become hidden or like the thumbnail its been replace for a placeholder, letting the user only see the available information.

## MVP
The code is build around the **Model****Viewcontroller****Presenter** Architecture Pattern. 
Each scene has their own a storyboard which is control by a Viewcontroller(UI), a Presenter(Logic) and a Model(Data). At the same time almost all the scenes have their UI components grouped in custom Views, which can be located in /Common/Views or inside their own scene folder, depending on the places it is used in the app.


## Images
<img src="https://user-images.githubusercontent.com/32483817/122318461-5e6bf000-cf1f-11eb-96a5-0eec733230f9.png" width="300" height="700">  <img src="https://user-images.githubusercontent.com/32483817/122318472-63c93a80-cf1f-11eb-8482-af6554169f10.png" width="300" height="700">

### Reminder
Remember to put your **API Key** into the info.plist, to have the app ready.
