# MensaWidget
## Welcome

This is a Mensa Widget that allows users seeing the lunch options from different outlets on the Uni Campus Griebnitzsee or all other outlets that are visible in openMensa, inside the sqeak environment.

## Download
Make sure you have a squeak image installed.
Then drag and drop the project via the provided .sar file into your squeak image.
Should you encounter problems, you can try to install manually via Apps > File List and "install SAR".

## Activation
To enable the MensaWidget icon, go to Apps > Preference Browser > Docking bars and set Show 'Mensa' to enabled.
A burger icon should appear in your docking bar.
To register the MensaWidget in your Squeak Apps, open up a Workspace and do `MWFrame register` once.
In your Squeak Apps you should now be able to find the MensaWidget.

## Usage
To open, either click on the burger and choose option "Potsdam" or click on the MensaWidget App.
You can also start the MensaWidget from a Workspace by doing `MWFrame newWithDefaultLocation`.
You will then have a screen with a single word showing you the current price category. You can then click on it and choose the most appropriate one in the following PopUp. After the initial setup has been completed you can close the window and open it again with any of the written ways and will proceed to the actual mensa widget.
After successfully opening the MensaWidget, select a day via the arrow keys or change the desired time to see meals from either lunch or dinner.\
Choose your food option and if you enjoyed it, give it a star.
This will remind you that you liked this meal, should it ever be offered again.
Should you also want to see the prices for a different group than the one you configured you can repeat the procedure by clicking on the price group name in the menubar. Be careful tho this new setting will also be stored and from there on you will see prices for that specified group.

If you want to see meals from somewhere else then click on the BurgerIcon and Other Cities or open it with MWFrame newWithLocationSwitch in a workspace. Then you will see three PopUps one after the other asking you for latitude and longittude coordinates (must be in Germany) and a radius in km's. After that it will check all known outlets in that area and open the widget with all of them. After that its the same procedure as written above.

Enjoy :)
