//github please stop with the weird editor
//todo - add fade duration customizer

CGFloat prefDelay = 5.0;
static BOOL fade = TRUE;

static void fadeIn(CGFloat timeToWait)
{
	if ([fade boolValue] == TRUE) {
		[UIView animateWithDuration:0.333 delay:timeToWait options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState animations:^{
			baseOffset = 0.0;
				view.alpha = 1.0;
		}
	}
}

static void clearIcons()
{
	if ([fade boolValue] == TRUE) {
		[UIView animateWithDuration:0.0 delay:0.0 options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState animations:^{
			baseOffset = 0.0;
				view.alpha = 0.0;
		}
	}
}

@interface SBIconController
- (void)_awayControllerUnlocked:(id)unlocked;
@end

%hook SBIconController

- (void)_awayControllerUnlocked:(id)unlocked {
clearIcons();
fadeIn(prefDelay);
	%orig;
}

%end

//todo: preferences
