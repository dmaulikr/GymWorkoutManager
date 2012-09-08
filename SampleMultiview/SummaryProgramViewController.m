//
//  ProgramViewController.m
//  GymApp
//
//  Created by James Dunwoody on 31/08/12.
//
//

#import "SummaryProgramViewController.h"
#import "SummaryProgramCell.h"
#import "Exercise.h"
#import "Program.h"
#import "WeightExercise.h"

@interface SummaryProgramViewController ()

@end

@implementation SummaryProgramViewController

@synthesize overlayImage;
@synthesize exerciseList;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.program = [self tempMakeExampleProgramWithName: @"Sample Program"];
    for( int i = 0; i < [self.program exerciseCount]; i++) {
        //    for (Exercise *exercise in self.program.exercises) {
        UILabel *exerciseLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,i*100,184,92)];
        exerciseLabel.text = [self.program exerciseAtIndex:i].name;
        [self.exerciseList addSubview: exerciseLabel];
    }
    [self.exerciseList setContentSize:CGSizeMake(self.exerciseList.frame.size.width, [self.program exerciseCount] * 200)];
}

- (Program *) tempMakeExampleProgramWithName: (NSString *) name
{
    Program *program = [[Program alloc] initWithName: name];
    
    int numExercises = 3 + arc4random() % 7;
    NSArray *exerciseNames = [NSArray arrayWithObjects:
                              @"Barbell Curls", @"Dumbell Curls", @"Push ups", @"Squats", @"Running on the spot",
                              @"Burpees", @"Sit ups", @"Tricep dips", @"Pull ups", nil];
    
    for (int e=0; e< numExercises; e++) {
        WeightExercise *exercise = [[WeightExercise alloc] init];
        exercise.name = [exerciseNames objectAtIndex: (arc4random() % [exerciseNames count])];
        exercise.rest = [NSString stringWithFormat:@"%is", e * 20];
        
        int numSets = 1 + arc4random() % 5;
        
        for (int s = 0; s < numSets; s++) {
            Set *set = [[Set alloc] init];
            set.weight = [NSNumber numberWithInt:(10 - s) * 6];
            set.reps = [NSNumber numberWithInt:2 * s + 10];
            set.rest = [NSNumber numberWithInt:20 - s];
            
            [exercise.sets addObject:set];
        }
        [program addExercise:exercise];
    }
    exerciseNames = nil;
    return program;
}

- (void)viewDidUnload
{
    [self setOverlayImage:nil];
    [self setExerciseList:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return interfaceOrientation == UIInterfaceOrientationLandscapeRight;
}

- (void)didMoveToParentViewController:(UIViewController *)parent
{
    NSLog(@"Did move to parent view controller");
}

// TABLE View stuff

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.program setCurrentExerciseIsAtIndex:indexPath.row];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.program exerciseCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Exercise *exercise = [self.program exerciseAtIndex:indexPath.row];
    NSString *cellIdentifier = @"SummaryViewCell";
    
    SummaryProgramCell *cell = (SummaryProgramCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[SummaryProgramCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.name.text = exercise.name;
    
    return cell;
    
}

- (NSUInteger)countOfList
{
    return [self.program exerciseCount];
}

- (Exercise *)objectInListAtIndex:(NSUInteger)theIndex
{
    return [self.program  exerciseAtIndex:theIndex];
}

- (IBAction)menuPlusButton:(id)sender
{
    Exercise *exercise = [[WeightExercise alloc] init];
    exercise.name = @"newExercise";
    Set *set = [[Set alloc] initWithReps: [NSNumber numberWithInt:2]];
    
    [exercise addSet: set];
    [self.program addExercise:exercise];
}

- (IBAction)bottomButtonPressed:(id)sender
{
    NSLog(@"bottom button pressed");
}

@end
