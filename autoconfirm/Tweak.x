%hook SBUserNotificationAlert

- (void)willActivate
{
    %orig;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        id (*returnSheet)(id,SEL) = (id(*)(id,SEL))objc_msgSend;
        id sheet = returnSheet(self,@selector(alertSheet));

        void (*clickButton)(id,SEL,int,_Bool) = (void(*)(id,SEL,int,_Bool))objc_msgSend;

        clickButton(sheet,@selector(dismissWithClickedButtonIndex:animated:),1,1);

        void (*alertButton)(id,SEL,id,_Bool) = (void(*)(id,SEL,id,_Bool))objc_msgSend;
        alertButton(self,@selector(alertView:clickedButtonAtIndex:),sheet,1);

        void (*cancelSend)(id,SEL) = (void(*)(id,SEL))objc_msgSend;
        cancelSend(self,@selector(cancel));

    });
}
%end