include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DelayedFade
DelayedFade_FILES = Tweak.xm
DelayedFade_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
