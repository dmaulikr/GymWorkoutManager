//
//  ProgramDelegate.h
//  GymApp
//
//  Created by James Dunwoody on 16/09/12.
//
//

#import <Foundation/Foundation.h>
#import "ProgramDataSource.h"

@interface ProgramDelegate : NSObject <UITableViewDelegate>

@property (strong, nonatomic) ProgramDataSource *programDataSource;

@end
