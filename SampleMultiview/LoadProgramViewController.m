//
//  LoadProgramViewController.m
//  GymApp
//
//  Created by James Dunwoody on 10/08/12.
//
//

#import "LoadProgramViewController.h"
#import "Program.h"
#import "CurrentViewController.h"
#import "WeightExercise.h"

@implementation LoadProgramViewController

@synthesize delegate;

- (IBAction)newProgramChosen:(id)sender {
    //    CurrentViewController *currentViewController = (CurrentViewController *) self.presentingViewController;
    
    Program *program = [[Program alloc] initWithProgramStatus:self.delegate];
    //    UINavigationController *nc = self.navigationController;
    
    Exercise *exercise;
    
    exercise = [[WeightExercise alloc] init];
    exercise.category = @"Super set";
    exercise.name = @"Dumbell Flys";
    exercise.rest = nil;
    exercise.reps = [NSNumber numberWithInt:8];
    exercise.weight = [NSNumber numberWithInt:24];
    exercise.exerciseWeightOrTimeMode = ExerciseWeightMode;
    [program addExercise:exercise];
    
    exercise = [[WeightExercise alloc] init];
    exercise.category = @"Set";
    exercise.name = @"Bicep Curls";
    exercise.rest = @"1min";
    exercise.reps = [NSNumber numberWithInt:18];
    exercise.weight = [NSNumber numberWithInt:40];
    exercise.exerciseWeightOrTimeMode = ExerciseWeightMode;
    [program addExercise:exercise];
    
    self.delegate.program = program;
    [self.delegate programLoadedWithProgram:program];
    //    currentViewController.program = program;
    
//    [self dismissModalViewControllerAnimated:YES];
    
    //    [self.navigationController popViewControllerAnimated:YES];
    //    [self performSegueWithIdentifier:@"chooseProgram" sender:self];
}
@end
