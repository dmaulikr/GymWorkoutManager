//
//  CurrentUIViewController.m
//  GymApp
//
//  Created by James Dunwoody on 27/08/12.
//
//

#import "CurrentUIViewController.h"

@interface CurrentUIViewController ()

@end

@implementation CurrentUIViewController
@synthesize comment;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self animateComments];
}

- (void) animateComments
{
    //    NSArray *words = [self.comment.text componentsSeparatedByString:@" "];
    //    int i =0;
    //
    //    self.comment.alpha = 0.0;
    //
    //    [UIView beginAnimations:@"Fade-in" context:NULL];
    //    [UIView setAnimationRepeatCount:HUGE_VALF];
    //    [UIView setAnimationDuration:1.0];
    //    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //    [UIView setAnimationRepeatAutoreverses:TRUE];
    //    self.comment.alpha = 1.0;
    //    self.comment.text = [words objectAtIndex:i];
    //    i = i++ % [words count];
    //    NSLog(@"i %i", i);
    //    [UIView commitAnimations];
    //
    
    //    int i =0;
    
    [UIView animateWithDuration:1.0
                          delay: 0
                        options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat
                     animations:^{
                         
                         NSLog(@"i is");
                         self.comment.alpha = 0.0;
                         //                         self.comment.text = [words objectAtIndex:i];
                         //                         i = i + 1;
                         //                         i = i % [words count];
                     }
                     completion:nil];
    
    
    //
    //    [UIView animateWithDuration:1.0 delay:0 options: UIViewAnimation<#(UIViewAnimationOptions)#> animations:animations:^{
    //
    //    } completion: ^(BOOL finished) {
    //
    //    }
    //
    //    [UIView animateWithDuration:1.0  animations:^{
    //        self.comment.alpha = 1;
    //        self.comment.alpha = 0;
    //    } completion:^(BOOL finished) {
    //        [self performSelectorOnMainThread:@selector(performAnimationOfFrameAtIndex:) withObject:[NSNumber numberWithInt:index+1] waitUntilDone:NO];
    //    }];
}

- (void)viewDidUnload
{
    [self setComment:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (void) programLoadedWithProgram:(Program *) withProgram
{
    [self dismissModalViewControllerAnimated:YES];
}


@end
