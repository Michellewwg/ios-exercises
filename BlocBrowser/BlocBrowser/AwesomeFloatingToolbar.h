//
//  AwesomeFloatingToolbar.h
//  BlocBrowser
//
//  Created by Michelle Rutherford on 4/17/15.
//  Copyright (c) 2015 Michelle Rutherford. All rights reserved.
//

#import <UIKit/UIKit.h>



@class AwesomeFloatingToolbar;

@protocol AwesomeFloatingToolbarDelegate <NSObject>
@optional

- (void) floatingToolbar:(AwesomeFloatingToolbar *)toolbar didSelectButtonWithTitle:(NSString *)title;


@end
@interface AwesomeFloatingToolbar : UIView
- (instancetype) initWithFourTitles:(NSArray *)titles;

- (void) setEnabled:(BOOL)enabled forButtonWithTitle:(NSString *)title;

@property (nonatomic, weak) id <AwesomeFloatingToolbarDelegate> delegate;

#define kBLCWebBrowserBackString NSLocalizedString(@"Back", @"Back command")
#define kBLCWebBrowserForwardString NSLocalizedString(@"Forward", @"Forward command")
#define kBLCWebBrowserStopString NSLocalizedString(@"Stop", @"Stop command")
#define kBLCWebBrowserRefreshString NSLocalizedString(@"Refresh", @"Reload command")

@end
