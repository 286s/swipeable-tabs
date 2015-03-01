//
//  UITabBarController+Swipe.m
//  SwipeableTabsDemo
//
//  Created by Antonio081014 on 2/28/15.
//  Copyright (c) 2015 antonio081014.com. All rights reserved.
//

#import "UITabBarController+Swipe.h"

@implementation UITabBarController (Swipe)

- (void)setupSwipeGestureRecognizersAllowCyclingTabs:(BOOL)isCycling
{
    SEL swipeLeftAction = isCycling ? @selector(handleSwipeLeftWithCycling:) : @selector(handleSwipeLeft:);
    UISwipeGestureRecognizer *leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:swipeLeftAction];
    leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.tabBar addGestureRecognizer:leftSwipeGestureRecognizer];
    
    SEL swipeRightAction = isCycling ? @selector(handleSwipeRightWithCycling:) : @selector(handleSwipeRight:);
    UISwipeGestureRecognizer *rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:swipeRightAction];
    rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.tabBar addGestureRecognizer:rightSwipeGestureRecognizer];
}

- (void)handleSwipeLeft:(UISwipeGestureRecognizer *)swipe {
    if (self.selectedIndex > 0) {
        self.selectedIndex -= 1;
    }
}

- (void)handleSwipeRight:(UISwipeGestureRecognizer *)swipe {
    if (self.selectedIndex + 1 < self.viewControllers.count) {
        self.selectedIndex += 1;
    }
}

- (void)handleSwipeLeftWithCycling:(UISwipeGestureRecognizer *)swipe {
    self.selectedIndex = (self.selectedIndex - 1 + self.viewControllers.count) % self.viewControllers.count;
}

- (void)handleSwipeRightWithCycling:(UISwipeGestureRecognizer *)swipe {
    self.selectedIndex = (self.selectedIndex + 1) % self.viewControllers.count;
}

@end
