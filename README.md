#HurdleJumpr
The home of the HurdleJumpr project.

## SRS

##### Using Latex

In contributing to the SRS, the only requirement is that you change the .tex file. If you have LaTeX tools installed, then feel free to use whichever text editor you prefer. If you do not have any LaTeX tools installed, use ShareLatex.com to edit the .tex file. Before each commit, it is _imperative_ that you test to see if the .tex file compiles! \*.aux and \*.log  are unnecessary to upload, and the \*.pdf should be updated regularly. If you are unfamiliar with LaTeX and need a cheat sheet, I highly recommend [this one](http://www.stdout.org/~winston/latex/latexsheet-a4.pdf). This cheat-sheet does not cover external packages. If you have need for an external package, do not hesitate to use it but _do_ state the reason that it is being added in your commit log.

#####Compiling LaTeX:
XeLaTex (XeTex) is being used to compile because it supports a wider range of characters beyond plain English numbers & letters, and includes support for modern font formats.

## Application Development Tools

We are using [Xamarin Studio](http://xamarin.com/studio) and [MonoGame](http://www.monogame.net/downloads/) to develop the application. Xamarin Studio is being used because it allows deployment to iOS, Android, and Windows Phone with a mostly shared code-base between the platforms. If deploying to iOS, a Mac is required because Xamarin requires the iOS and XCode libraries, which are only available on OS X.
