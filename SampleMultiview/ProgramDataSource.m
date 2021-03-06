//
//  ProgramDataSource.m
//  GymApp
//
//  Created by James Dunwoody on 16/09/12.
//
//

#import "ProgramDataSource.h"

@implementation ProgramDataSource

@synthesize program = _program;

- (id) initWithObservers: (id<ProgramChangeObserver>) firstArg, ...
{
    if (self = [super init]) {
        observers = [[NSMutableArray alloc] init];
        va_list args;
        va_start(args, firstArg);
        
        for (id<ProgramChangeObserver> arg = firstArg; arg != nil; arg = va_arg(args, id<ProgramChangeObserver>)) {
            [observers addObject:arg];
        }
        va_end(args);
    }
    return self;
}

- (void) notifyProgramChangeObservers
{
    for (id<ProgramChangeObserver> observer in observers) {
        [observer programChanged];
    }
    [self save];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.program exerciseCount];
}

- (void) save
{
    NSLog(@"Saving");
    NSError *error;
    if (![self.context save:&error]) {
        NSLog(@"Failed to save");
    }
}

@end
