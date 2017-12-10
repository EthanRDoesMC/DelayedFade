#import <UIKit/UIKit.h>





// EndGoal: Icons don't do the fly-in thing on unlock but rather fade in after a set amount of time
//There is no need to remind me how awful this code is - I'm well aware :P




//thanks AppleBetas
%hook SBLockScreenViewController
-(void)finishUIUnlockFromSource:(int)arg1 {
%orig;
[[NSNotificationCenter defaultCenter] postNotificationName:@"DelayedFadeWeUnlocked"
                                                    object:nil];
}
%end
//Depending on which one works the other will remain uncommented
//test on ios 9, you fool

//%hook SBRootFolderView
//-(id)initWithFrame:(CGRect)frame {
%hook SBRootFolderController
-(void)viewDidLoad {
[[NSNotificationCenter defaultCenter] addObserver:(id)observer
           selector:(SEL)doTheThing
               name:(NSNotificationName)@"DelayedFadeWeUnlocked"
               object:nil];
              %orig;
}
%new
-(void)doTheThing(NSNotification *)notification
{
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
