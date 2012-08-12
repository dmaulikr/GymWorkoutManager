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
#import "LoadProgramCell.h"

@implementation LoadProgramViewController

@synthesize tableView = _tableView;
@synthesize delegate = _delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.programs = [[NSMutableArray alloc] initWithObjects:
                     [[Program alloc] initWithName: @"11 August 10:01pm"],
                     [[Program alloc] initWithName: @"12 August 05:03pm"],
                     [[Program alloc] initWithName: @"13 August 10:01pm"],
                     [[Program alloc] initWithName: @"14 August 10:01pm"],
                     [[Program alloc] initWithName: [self currentDateString]],
                     nil];
    
//    self.tableDelegate = [[LoadProgramTableDelegate alloc] init];
//    self.tableView.dataSource = [[LoadProgramDataSource alloc] init];
    
//    self.tableView.delegate = self.tableDelegate;
//    self.tableView.dataSource = self.tableDelegate;
    
}

- (IBAction)newProgramChosen:(id)sender {
    
    Program *program = [[Program alloc] initWithName:[self currentDateString]];
    
    //    Exercise *exercise;
    //
    //    exercise = [[WeightExercise alloc] init];
    //    exercise.category = @"Super set";
    //    exercise.name = @"Dumbell Flys";
    //    exercise.rest = nil;
    //    exercise.reps = [NSNumber numberWithInt:8];
    //    exercise.weight = [NSNumber numberWithInt:24];
    //    exercise.exerciseWeightOrTimeMode = ExerciseWeightMode;
    //    [program addExercise:exercise];
    //
    //    exercise = [[WeightExercise alloc] init];
    //    exercise.category = @"Set";
    //    exercise.name = @"Bicep Curls";
    //    exercise.rest = @"1min";
    //    exercise.reps = [NSNumber numberWithInt:18];
    //    exercise.weight = [NSNumber numberWithInt:40];
    //    exercise.exerciseWeightOrTimeMode = ExerciseWeightMode;
    //    [program addExercise:exercise];
    //
    self.delegate.program = program;
    [self.delegate programLoadedWithProgram:program];
    
    //    CurrentViewController *currentViewController = (CurrentViewController *) self.presentingViewController;
    //    currentViewController.program = program;
    //    [self dismissModalViewControllerAnimated:YES];
    //    [self.navigationController popViewControllerAnimated:YES];
    //    [self performSegueWithIdentifier:@"chooseProgram" sender:self];
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}

- (NSString *) currentDateString
{
    NSDate *now = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Australia/Melbourne"]];
    return [formatter stringFromDate:now];
}


//
//- (id) initWithController: (id<LoadProgramObserver>) withLoadProgramViewObserver
//{
//    self = [super init];
//    
//    if (self) {
//        Program *program = [[Program alloc] init];
//        program.name = @"11 August 10:01pm";
//        
//        self.programs = [[NSMutableArray alloc] initWithObjects:program, nil];
//        self.loadProgramObserver = withLoadProgramViewObserver;
//    }
//    
//    return self;
//}

- (NSUInteger)countOfList {
    return [self.programs count];
}

- (Program *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.programs objectAtIndex:theIndex];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self countOfList];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return @"title for header in section";
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Program *program = [self objectInListAtIndex:indexPath.row];
    NSString *cellIdentifier = @"programCell";
    
    LoadProgramCell *cell = (LoadProgramCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[LoadProgramCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    [[cell title] setText: program.name];
    cellIdentifier = nil;
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    Program *program = [self.dataSource objectInListAtIndex:indexPath.row];
//    cell.textLabel.textColor = [UIColor whiteColor];
//    cell.backgroundColor = [UIColor brownColor];
        
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    Exercise *exercise = [self.dataController objectInListAtIndex:indexPath.row];
//
//    if (exercise.isAdd) {
//        return tableView.rowHeight;
//    } else {
//        return 92;
//    }
//}

//
//-(void) addExerciseWithName:(NSString *)name withReps: (NSString *)reps withRest: (NSString *)rest withWeight: (NSString *)weight withBodyPart: (NSString *)selectedBodyPart withIntensity:(NSString *)selectedIntensity withCategory:(NSString *)selectedCategory
//{
//    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
//
//    Exercise *exercise = [[Exercise alloc] init];
//    exercise.name = name;
//    exercise.reps = [numberFormatter numberFromString: reps];
//    exercise.rest = rest;
//    exercise.weight = [numberFormatter numberFromString:weight];
//    exercise.bodyPart = selectedBodyPart;
//    exercise.intensity = selectedIntensity;
//
//    exercise.category = selectedCategory;
//    [self.dataController.exercises addObject:exercise];
//}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleInsert) {
//
//
//    } else if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [self.dataController.program removeExerciseAtIndex:indexPath.row];
//        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//        [self.tableView reloadData];
//
//        //        NSLog(@"%d", [self.dataController.exercises count]);
//        //        NSLog(@"%d", [self.tableView numberOfRowsInSection:0]);
//        //        [self.tableView setEditing:FALSE animated:YES];
//
//        //        [self.tableView deleteRowsAtIndexPaths:indexPath withRowAnimation:YES];
//        //        int row = indexPath.row;
//        //        SimpleEditableListAppDelegate *controller = (SimpleEditableListAppDelegate *)[[UIApplication sharedApplication] delegate];
//        //        [controller removeObjectFromListAtIndex:indexPath.row];
//        //        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    }
//}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//-(void) addExerciseWithExercise:(Exercise *)exercise
//{
//    [self.dataSource.program addExercise:exercise];
//}

//-(void) deleteWithIndexPaths: (NSArray *)indexPaths
//{
//    for (NSIndexPath *path in indexPaths) {
//        [self.dataController.program removeExerciseAtIndex:path.row];
//    }
//}

//-(void) updateRowWithExercise: (Exercise *) exercise withRow: (NSInteger) row
//{
//    [self.dataController.program updateExerciseAtIndex:row withObject:exercise];
//    [self.tableView reloadData];
//}

//-(void) updateRowWithRow: (NSInteger)row withComponent: (NSInteger)component
//{
//    [self.tableView
//}

//- (void)insertRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
//{
//    NSLog(@"Insert rows");
//}
//
//- (void)deleteRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
//{
//    NSLog(@"Delete rows");
//}
//
//- (void)moveRowAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath
//{
//    NSLog(@"Move rows");
//}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    return UITableViewCellEditingStyleInsert;
    return UITableViewCellEditingStyleDelete;
}
@end