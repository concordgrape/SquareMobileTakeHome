# SquareMobileTakeHome
 
## Build tools & versions used
    Xcode version 13.4.1 (13F100)
    Swift 5 & IOS 14
    
    No external resources or packages were used
    
    *Capabilities for iPhone and Portrait mode only

## Steps to run the app
    1. Ensure Xcode is properly installed with a simulator and/or a physical device present
    2. Have a secure internet connection (Used to retrieve JSON and image data)
    3. After selecting a simulator or a physical device, click the "play" button on Xcode to build and run the application
    4. If data isn't present on the screen, you may need to pull to refresh
    
    *As the application won't be submitted to the App Store, you do not need to worry about signing and/or profiles/certificates

## What areas of the app did you focus on?
    I mainly focused on recieving the required data from the JSON endpoint, as the data isn't authenticated, I needed to parse and grab the required variables. To complete this, I created a custom struct that stored the required variables. This would allow the data to be stored in a struct array after it's grabbed and parsed from the endpoint.
    
    From here, I then focused on displaying the recieved data into a tableview. The data can be presented by "scrolling to refresh" the tableview. If the data changes on the endpoint, so will the data within the application. 

## What was the reason for your focus? What problems were you trying to solve?
    The main problem I was trying to solve was parsing of the data. By ensuring that we are recieving correctly formatted data, we can be sure that our application won't crash if we don't. However, if we recieve malformed data, the application will take procautions and won't load anything to the tableview.

## How long did you spend on this project?
    This project took me roughly 3 hours to complete, I wanted to ensure the proper tests and functionality of the application was correct.

## Did you make any trade-offs for this project? What would you have done differently with more time?
    If I had more time to work on this project, I would display more data relating to the employees and display a more efficient UI.

## What do you think is the weakest part of your project?
    The weakest part of my project is the weak user interface, it would be interesting to expand upon this and make the application more user friendly.

## Did you copy any code or dependencies? Please make sure to attribute them here!
    N/A

## Is there any other information you’d like us to know?
    I've included multiple URLs to test the endpoints, this includes the malformed and empty employee JSON string.
    
    I also loved working on this application, it was simple but challenging...
