//
//  EditWeightUIPickerViewController.m
//  GymApp
//
//  Created by James Dunwoody on 6/10/12.
//
//

#import "EditRestUIPickerViewController.h"

#import "EditRepViewController.h"
#import "RepititionView.h"
#import "EditRepDelegate.h"
#import "EditRestDelegate.h"
#import "EditWeightDelegate.h"
#import "ProgramDataSource.h"
#import "ExerciseDetailViewController.h"

@interface EditRestUIPickerViewController ()

@end

@implementation EditRestUIPickerViewController

@synthesize exerciseViewController = _exerciseViewController;
@synthesize set = _set;
@synthesize pickerView = _pickerView;
@synthesize programDatasource = _programDatasource;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (id) init
{
    if (self = [super init]) {
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}

- (void) setup
{
    editRestDelegate = [[EditRestDelegate alloc] init];
    self.pickerView.dataSource = editRestDelegate;
    self.pickerView.delegate = editRestDelegate;
    editRestDelegate.set = self.set;
    editRestDelegate.programDataSource = self.programDatasource;
    
    [self.pickerView selectRow: [editRestDelegate indexOfSet: self.set] inComponent:0 animated:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
}

@end
