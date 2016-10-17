# Swift Weather Animations

### Goals
By the end of this lab the student should:

  * Be familiar with animations using keyframes and transitions
  * Be able to start, chain, and repeat animations
  * Be able to set animations to repeat

## App should

1. Display moon or sun based on time of day
2. Have a "change weather" button which presents or hides cloud via animation onto or off screen, respectively
  * Cloud should "spring" into place
3. If cloud is displayed for more than 5 seconds, rain should start and background should change from blue to gray until the cloud is hidden

![this](https://media.giphy.com/media/l3vRbYYtb0nZMs2A0/giphy.gif)

### Replacing Storyboards with Code

You may have noticed that there's no `main.storyboard` in this project. On many development teams, storyboard files are shunned in favor of working entirely in code. This is due to the challenges of managing merge conflicts when multiple people are working on the UI of an app.

Storyboards are notorious for how persnickety they are, and will register and automatically save changes if you simply open and look at them even without changing any of the content. The problem is compounded by how the errors are handled in Xcode, which prevents you from opening a storyboard file if there are any reported conflicts within it. When you finally manage to open the storyboard file in a plaintext editor, the conflicts themselves are very difficult to interpret.

There's much discussion around handling storyboard-based UI development, and many ways to make it work for your team. Some teams, however, completely do away with storyboards and instead load view controllers directly from code.

If you look in the `AppDelegate` file, you'll see that we have a property called `window`, which is and optional `UIWindow`. Normally, our project settings point toward a primary interface for our app, which defaults to `main.storyboard`. This automatically instantiates a `UIWindow`, which is then passed to the `AppDelegate`. The `window` is then pointed to the initial view controller by the storyboard. The rest of the process you're already familiar with.

Instead of using a storyboard to create a `UIWindow`, this is now taken care of in `AppDelegate`'s `application(_:didFinishLaunchingWithOptions:)`. After setting the value for `window`, an instance of `WeatherViewController` is created, set as the root view controller, and presented to the user. From here, the view controller is free to do its thing.

This may or may not come up in the code you write and work on, but it's a great way to get a sense of what goes on under the hood any time you open up an app!

## Advanced Challenges

Attempt the following challenges only if you feel comfortable with the preceding instructions. These are ordered by increasing difficulty and there 

### Challenge 1

Don't use constraints at all. Sounds crazy, right? But it's totally doable. In fact, the example animation gifs were all created with animation on the `frame`s of each view.

### Challenge 2

Replace the sun and moon animation with methods from the `CAAnimation` class. Specifically, find a way to animate the rise and fall of the sun and moon along a circular bezier curve path.

### Challenge 3

What's a storm without some rain? (Heat lightning!) Find a way to animate rainfall when the `stormButton` is tapped. It should start only after the cloud has fully appeared and end before the cloud disappears.

**Warning:** There is no official solution for Challenge 3. There are many potential avenues you can follow, but the eventual outcome is up to you!