# MarvelPJGuide
The **MarvelPJGuide** app allows the user to navigate through all the characters in the Marvel universe and see every detail of their favorite characters.

The list loads a maximum of 20 characters at the same time, when the user scrolls down, it starts loading the next 20 available characters.
When you touch the character image, a full-screen size view appears, containing the detailed information of the touched character.
When the character has some of the information empty or undefined, the views that contain that information are hidden or, like the thumbnail, are replaced with a placeholder, allowing the user to see only the information available.

## MVP
The code is based on the **Model****View****Presenter** Architecture Pattern.
- The model interface defines all the data to be used in the scene.
- The view only shows the data and routes the events from the screen to the presenter.
- The presenter communicates between the model and the view and decides what to do. 

Each scene has its own storyboard that is controlled by a view controller (UI), a presenter (logic), and a model (data). At the same time, almost all scenes have their UI components grouped into custom views, which can be located in /Common/Views or within its own scene folder, depending on where it is used in the application. 


## Images
<img src="https://user-images.githubusercontent.com/32483817/122318461-5e6bf000-cf1f-11eb-96a5-0eec733230f9.png" width="300" height="700">  <img src="https://user-images.githubusercontent.com/32483817/122318472-63c93a80-cf1f-11eb-8482-af6554169f10.png" width="300" height="700">

### Reminder
Remember to put your **API Key** in the info.plist to have the application ready to use. 
