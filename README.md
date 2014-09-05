LoadingView
===========

This is a replacement for a UIActivityIndicator. It has three concentric rings that rotate at different speeds when startAnimating is called.

You are welcome to change the color of the rings as you like by changing the colorCustomLayer variables.

Feel free to use this as you choose

Just drop a UIView into your storyboard and change the class to BHKLoadingView or init a BHKLoadingView and add it as a subview

If you choose to go with the storyboard method, you may wish to change the backgroundColor to something that is not white so that you can see the view in your storyboard. You can do this and the view will be changed to clear in the init

Just like UIActivityIndicator you start and stop it with -startAnimating or -stopAnimating