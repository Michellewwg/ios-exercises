//
//  ViewController.m
//  BlocBrowser
//
//  Created by Michelle Rutherford on 4/13/15.
//  Copyright (c) 2015 Michelle Rutherford. All rights reserved.
//

#import "ViewController.h"
#import "AwesomeFloatingToolbar.h"
#import <WebKit/WebKit.h>

@interface ViewController () <WKNavigationDelegate, UITextFieldDelegate, AwesomeFloatingToolbarDelegate>

@property (nonatomic, strong) WKWebView *webview;
@property (nonatomic, strong) UITextField *textField;
/*
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIButton *forwardButton;
@property (nonatomic, strong) UIButton *stopButton;
@property (nonatomic, strong) UIButton *reloadButton;
*/
@property (nonatomic, assign) NSUInteger frameCount;
@property (nonatomic, strong) AwesomeFloatingToolbar *awesomeToolbar;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@end

@implementation ViewController

#pragma mark - UIViewController

- (void)loadView {
    
    UIView *mainView = [UIView new];
    
    self.webview = [[WKWebView alloc]init];
    
    self.webview.navigationDelegate = self;
    
    
    self.textField = [[UITextField alloc] init];
    self.textField.keyboardType = UIKeyboardTypeURL;
    self.textField.returnKeyType = UIReturnKeyDone;
    self.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField.placeholder = NSLocalizedString(@"Website URL", @"Placeholder textfor web browser URL field");
    self.textField.backgroundColor = [UIColor colorWithWhite:220/255.0f alpha:1];
    self.textField.delegate = self;
    
    /*
    self.backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.backButton setEnabled:NO];
    self.forwardButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.forwardButton setEnabled:NO];
    self.stopButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.stopButton setEnabled:NO];
    self.reloadButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.reloadButton setEnabled:NO];
    
     *//*
    [self.backButton setTitle:NSLocalizedString(@"Back", @"Back comnmand") forState:UIControlStateNormal];
    [self.backButton addTarget:self.webview action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    
    [self.forwardButton setTitle:NSLocalizedString(@"Forward", @"Forward comnmand") forState:UIControlStateNormal];
    [self.forwardButton addTarget:self.webview action:@selector(goForward) forControlEvents:UIControlEventTouchUpInside];
    
    [self.stopButton setTitle:NSLocalizedString(@"Stop", @"Stop comnmand") forState:UIControlStateNormal];
    [self.stopButton addTarget:self.webview action:@selector(stopLoading) forControlEvents:UIControlEventTouchUpInside];
    
    [self.reloadButton setTitle:NSLocalizedString(@"Refresh", @"Reload comnmand") forState:UIControlStateNormal];
    [self.reloadButton addTarget:self.webview action:@selector(reload) forControlEvents:UIControlEventTouchUpInside];
    */
    
    self.awesomeToolbar = [[AwesomeFloatingToolbar alloc] initWithFourTitles:@[kBLCWebBrowserBackString, kBLCWebBrowserForwardString, kBLCWebBrowserStopString, kBLCWebBrowserRefreshString]];
    
    self.awesomeToolbar.delegate = self;
    
    //[self addButtonTargets];
    
   
    
    for (UIView *viewToAdd in @[self.webview, self.textField, self.awesomeToolbar]) {
        [mainView addSubview:viewToAdd];
    }
    
    
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.activityIndicator];
    
    
    
    self.view = mainView;
    
}

- (void)viewDidLoad {
   [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Welcome!", @"Welcome title")
                                              message:NSLocalizedString(@"Get excited to use the best web browser ever!", @"Welcome comment")
                                              delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"OK, I'm excited!", @"Welcome button title") otherButtonTitles:nil];
    [alert show];

}

- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    // First, calculate some dimensions.
    
    static const CGFloat itemHeight = 50;
    
    CGFloat width = CGRectGetWidth(self.view.bounds);
   // CGFloat browserHeight = CGRectGetHeight(self.view.bounds) - itemHeight;
   // CGFloat browserHeight = CGRectGetHeight(self.view.bounds) - itemHeight - itemHeight;
    
    CGFloat browserHeight = CGRectGetHeight(self.view.bounds) - itemHeight;
  //  CGFloat buttonWidth = CGRectGetWidth(self.view.bounds) / 4;
    
    
    // Now, assign the frames
    self.textField.frame = CGRectMake(0, 0, width, itemHeight);
    self.webview.frame = CGRectMake(0, CGRectGetMaxY(self.textField.frame), width,
                                          browserHeight);
    
    

    self.awesomeToolbar.frame = CGRectMake(20, 100, 280, 60);
     }

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    NSString *URLString = textField.text;
    NSURL *URL = [NSURL URLWithString:URLString];
    
    if (!URL.scheme)
    {
        URL = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@",URLString]];
    }
    
    
    if (URL) {
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
        [self.webview loadRequest:request];
    }
    return NO;
    }

#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *) navigation withError:(NSError *)error {
        [self webView:webView didFailNavigation:navigation withError:error];
    }
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *) navigation withError:(NSError *)error {
    if (error.code != -999) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", @"Error")
                                                  message:[error localizedDescription]
                                                  delegate:nil
                                                  cancelButtonTitle:NSLocalizedString(@"OK",nil) otherButtonTitles:nil];
        [alert show];
    }
}
#pragma mark - Miscellaneous

- (void) updateButtonsAndTitle {
    
    NSString *webpageTitle = [self.webview.title copy];
    
    if ([webpageTitle length]) {
        self.title = webpageTitle;
    } else {
        self.title = self.webview.URL.absoluteString;
    }
   
   
    if (self.webview.isLoading) {
        [self.activityIndicator startAnimating];
    }
    else {
        [self.activityIndicator stopAnimating];
    }
    
    [self.awesomeToolbar setEnabled:[self.webview canGoBack] forButtonWithTitle:kBLCWebBrowserBackString];
    [self.awesomeToolbar setEnabled:[self.webview canGoForward] forButtonWithTitle:kBLCWebBrowserForwardString];
    [self.awesomeToolbar setEnabled:self.frameCount > 0 forButtonWithTitle:kBLCWebBrowserStopString];
    [self.awesomeToolbar setEnabled:self.webview.request.URL && self.frameCount == 0 forButtonWithTitle:kBLCWebBrowserRefreshString];
  
}



#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
     [self updateButtonsAndTitle];
    }
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    [self updateButtonsAndTitle];
}

- (void) resetWebView {
    [self.webview removeFromSuperview];
    
    WKWebView *newWebView = [[WKWebView alloc] init];
    
    newWebView.navigationDelegate = self;
    
    [self.view addSubview:newWebView];
    
    self.webview = newWebView;
    
   // [self addButtonTargets];
    
    self.textField.text = nil;
  // [self updateButtonsAndTitle];
    
    
    
}

/*
 -(void) addButtonTargets {
    
     for (UIButton *button in @[self.backButton, self.forwardButton, self.stopButton,self.reloadButton]) {
         [button removeTarget:nil action:NULL forControlEvents:UIControlEventTouchUpInside];
     }
     
     [self.backButton addTarget:self.webview action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
     [self.forwardButton addTarget:self.webview action:@selector(goForward) forControlEvents:UIControlEventTouchUpInside];
     [self.stopButton addTarget:self.webview action:@selector(stopLoading) forControlEvents:UIControlEventTouchUpInside];
     [self.reloadButton addTarget:self.webview action:@selector(reload) forControlEvents:UIControlEventTouchUpInside];
     
 }
*/

#pragma mark - AwesomeFloatingToolbarDelegate

- (void) floatingToolbar:(AwesomeFloatingToolbar *)toolbardid SelectButtonWithTitle:(NSString *)title {
    if ([title isEqual:NSLocalizedString(@"Back", @"Back command")]) {
        [self.webview goBack];
    } else if ([title isEqual:NSLocalizedString(@"Forward", @"Forward command")]) {
            [self.webview goForward];
            } else if ([title isEqual:NSLocalizedString(@"Stop", @"Stop command")]) {
                [self.webview stopLoading];
            } else if ([title isEqual:NSLocalizedString(@"Refresh", @"Reload command")]) {
                    [self.webview reload];
                }
    }


@end
