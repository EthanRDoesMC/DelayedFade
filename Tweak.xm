#import <UIKit/UIKit.h>

@interface SBIconController
- (void)_awayControllerUnlocked:(id)unlocked;
@end

%hook SBIconController

//alright, so here's my problem. #1: i cannot find _awayControllerUnlocked in FLEXible. 
// #2: I need to somehow use the view of SBIconController (SBIconContentView) but how
// #3? : The two animations may be in the way of each other
// EndGoal: Icons don't do the fly-in thing on unlock but rather fade in after a set amount of time
//There is no need to remind me how awful this code is - I'm well aware :P

//thanks AppleBetas

- (void)_awayControllerUnlocked:(id)unlocked {
%orig;
for (UIView *view in self.subviews) {
    view.alpha = 0.0;
}
[UIView animateWithDuration:0.333 delay:5.0 options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState animations:^{
    for (UIView *view in self.subviews) {
        view.alpha = 1.0;
    }
} completion:NULL];
}
%end
