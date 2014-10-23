#HurdleJumpr
The home of the HurdleJumpr project.

## SRS

##### Using Latex

In contributing to the SRS, the only requirement is that you change the .tex file. If you have LaTeX tools installed, then feel free to use whichever text editor you prefer. If you do not have any LaTeX tools installed, use ShareLatex.com to edit the .tex file. Before each commit, it is _imperative_ that you test to see if the .tex file compiles! \*.aux and \*.log  must not be uploaded, and the \*.pdf should be updated regularly. If you are unfamiliar with LaTeX and need a cheat sheet, I highly recommend [this one](http://www.stdout.org/~winston/latex/latexsheet-a4.pdf).

#####Compiling LaTeX:
XeLaTex (XeTex) is being used to compile because it supports a wider range of characters beyond plain English numbers & letters, and includes support for modern font formats.

## Application Development Tools

Development environment has yet to be decided. 
We are either using Xamarin Studio (instructions below), Unreal Engine 4 (now avail. for free with GitHub), or Unity. Decision to be made 10/23/14 

We are using [Xamarin Studio](http://xamarin.com/studio) and [MonoGame](http://www.monogame.net/downloads/) to develop the application. Xamarin Studio is being used because it allows deployment to iOS, Android, and Windows Phone with a mostly shared code-base between the platforms. If deploying to iOS, a Mac is required because Xamarin requires the iOS and XCode libraries, which are only available on OS X. If you are on a Mac, I recommend installing the MonoGame and Xamarin documentation & cheat-sheets in Dash. The official Xamarin documentation and starter guides are available [here](http://developer.xamarin.com).

Please familiarize yourselves with Xamarin by following the [official guide](http://developer.xamarin.com/guides/cross-platform/getting_started/). Once you have familiarized yourself with Xamarin, [set up MonoGame](http://www.johankarlsson.net/2014/09/setting-up-monogame-for-ios.html) and familiarize yourself with its API  by building a [Hello World application](http://jaquadro.com/2013/09/monogame-hello-world-on-mac-os-x-and-xamarin-studio/).
