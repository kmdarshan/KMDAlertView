//
//  KMDAlert.m
//  Alert
//
//  Created by Darshan Katrumane on 2/22/15.
//  Copyright (c) 2015 Darshan Katrumane. All rights reserved.
//

#import "KMDAlert.h"
@interface KMDAlert () {
    NSString *title;
    NSString *message;
    NSString *okButton;
    UIView *backgroundView;
    NSString *cancelButton;
    UIAlertView *alert;
}
@end

@implementation KMDAlert
-(id) initWithFrame:(CGRect)frame title:(NSString*)titleForError message:(NSString*)messageForError ok:(NSString*) ok {
    if ((self = [super initWithFrame:frame]))
    {
        title = titleForError;
        message = messageForError;
        if ([ok length] > 0) {
            okButton = ok;
        } else {
            okButton = @"OK";
        }
        [self setUpOk];
        self.clipsToBounds = YES;
    }
    return self;
}
-(id) initWithFrame:(CGRect)frame title:(NSString*)titleForError message:(NSString*)messageForError ok:(NSString*) ok cancel:(NSString*)cancel{
    if ((self = [super initWithFrame:frame]))
    {
        title = titleForError;
        message = messageForError;
        if ([ok length] > 0) {
            okButton = ok;
        } else {
            okButton = @"OK";
        }
        if ([cancel length] > 0) {
            cancelButton = cancel;
        } else {
            cancelButton = @"Cancel";
        }
        [self setUpCancel];
        self.clipsToBounds = YES;
    }
    return self;
}

#pragma mark - Setup
-(void) setUpOk {
    backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    backgroundView.backgroundColor = [UIColor blackColor];
    backgroundView.alpha = 0.6;
    [[[[UIApplication sharedApplication] delegate] window] addSubview:backgroundView];

    alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles:okButton, nil];
    [alert show];
}

-(void) setUpCancel {
    backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    backgroundView.backgroundColor = [UIColor blackColor];
    backgroundView.alpha = 0.6;
    [[[[UIApplication sharedApplication] delegate] window] addSubview:backgroundView];
    
    alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButton otherButtonTitles:okButton, nil];
    [alert show];
}

#pragma mark - Alert view delegates
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([self.delegate respondsToSelector:@selector(clickButtonAtIndex:buttonWithTag:)]) {
        [self.delegate clickButtonAtIndex:buttonIndex buttonWithTag:[alertView tag]];
    }
    [UIView animateWithDuration:0.5 animations:^{
        [backgroundView setAlpha:0];
    } completion:^(BOOL finished) {
        [backgroundView removeFromSuperview];
        [self removeFromSuperview];
    }];
}
-(void)setAlertTag:(NSInteger)alertTag {
    [alert setTag:alertTag];
}
@end
