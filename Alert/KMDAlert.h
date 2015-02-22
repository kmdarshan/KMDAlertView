//
//  KMDAlert.h
//  Alert
//
//  Created by Darshan Katrumane on 2/22/15.
//  Copyright (c) 2015 Darshan Katrumane. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KMDAlert;
@protocol KMDAlertDelegate <NSObject>
@optional
// multiple alerts in a view requires tag to handle them
-(void)clickButtonAtIndex:(NSInteger)index buttonWithTag:(NSInteger)tag;
@end

@interface KMDAlert : UIView
@property (nonatomic, weak) id<KMDAlertDelegate> delegate;
@property (nonatomic) NSInteger alertTag;
-(id) initWithFrame:(CGRect)frame title:(NSString*)titleForError message:(NSString*)messageForError ok:(NSString*) ok;
-(id) initWithFrame:(CGRect)frame title:(NSString*)titleForError message:(NSString*)messageForError ok:(NSString*) ok cancel:(NSString*)cancel;
@end
