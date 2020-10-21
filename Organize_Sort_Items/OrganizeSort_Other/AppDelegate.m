//
//  AppDelegate.m
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/19.
//

#import "AppDelegate.h"
#import "WXYSortRootController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - <UIWindowSceneDelegate>

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions API_AVAILABLE(ios(13.0)) {
    if (@available(iOS 13.0, *)) {
        if ([scene isKindOfClass:UIWindowScene.class]) {
            self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
            [self p_DidInitWindow];
        }
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self p_DidInitWindow];
    return YES;
}

- (void)p_DidInitWindow {
    self.window.rootViewController = [self p_GenerateRootViewController];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

- (UIViewController *)p_GenerateRootViewController{
    return [[UINavigationController alloc] initWithRootViewController:[[WXYSortRootController alloc] init]];
}


@end
