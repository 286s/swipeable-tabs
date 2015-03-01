# swipeable-tabs
A simple UITabBarController Category which allows changing tabs with left and right swipe gestures on the <b>Tab Bar</b>.

#Usage
* Add `UITabBarController+Swipe.h` and `UITabBarController+Swipe.m` to your project.

* Import it in the `AppDelegate` implementation. Setup the `UITabBarController` with:


        - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
        {
          // Override point for customization after application launch.
          
          UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
            [tabBarController setupSwipeGestureRecognizersAllowCyclingTabs:YES];
            return YES;
        }


* To activate the cycling behavior, use:

    `[tabBarController setupSwipeGestureRecognizersAllowCyclingTabs:YES];`
