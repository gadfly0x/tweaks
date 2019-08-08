%hook AppDelegate

- (void)application:(id)arg1 didRegisterForRemoteNotificationsWithDeviceToken:(id)arg2{
    NSLog(@"DeviceToken:%@", arg2);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    NSLog(@"DeviceToken");
     UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert| UIUserNotificationTypeBadge| UIUserNotificationTypeSound categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    %orig;
    return YES;
}

%end