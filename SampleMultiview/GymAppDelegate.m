//
//  SampleAppDelegate.m
//  SampleMultiview
//
//  Created by James on 23/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GymAppDelegate.h"
#import "ProgramViewController.h"
#import "ExerciseTableDelegate.h"
#import "ExercisePickerDelegate.h"
#import "CurrentViewController.h"

@implementation GymAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    CurrentViewController *currentViewController = (CurrentViewController *)self.window.rootViewController;

    //ProgramViewController *exerciseViewController = (ProgramViewController *)self.window.rootViewController;

//    self.tableDelegate = [[ExerciseTableDelegate alloc] init];
//    self.dataController = [[ExerciseDataController alloc] initWithProgramStatus:exerciseViewController];
//    self.pickerDelegate = [[ExercisePickerDelegate alloc] initWithWithController:exerciseViewController];
//    
//    tableDelegate.dataController = dataController;
//    exerciseViewController.tableDelegate = tableDelegate;
//    exerciseViewController.pickerDelegate = pickerDelegate;
    
    return YES;
}

//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    // Override point for customization after application launch.
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//    ExerciseTableDelegate *tableDelegate = [[ExerciseTableDelegate alloc] initWithTableView:rootViewController.tableView];
//    OptionsViewController *optionsViewController = (OptionsViewController *)[[navigationController viewControllers] objectAtIndex:0];
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle: nil];
//
//    ExerciseViewController *exerciseViewController = (ExerciseViewController*)[storyboard instantiateViewControllerWithIdentifier: @"exerciseViewController"];


//    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
//    ExerciseViewController *exerciseViewController = (ExerciseViewController *)[[navigationController viewControllers] objectAtIndex:0];


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    // store the program
    // make the app background friendly to continue to timer if any
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//- (void)applicationDidFinishLaunching:(UIApplication *)application
//{
//    self.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"carbon_fibre.png"]];
//    
//    self.exerciseViewController.backgroundColor = self.backgroundColor;
//    
////    [window addSubview:tabBarController.view];
////    [window makeKeyAndVisible];
//}

@end
