//
//  AwesomeFloatingToolbar.m
//  BlocBrowser
//
//  Created by Michelle Rutherford on 4/17/15.
//  Copyright (c) 2015 Michelle Rutherford. All rights reserved.
//

#import "AwesomeFloatingToolbar.h"

@interface AwesomeFloatingToolbar()

@property (nonatomic, strong) NSArray *currentTitles;
@property (nonatomic, strong) NSArray *colors;
@property (nonatomic, strong) NSArray *buttons;
@property (nonatomic, weak) UILabel *currentLabel;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;
@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;
@property (nonatomic, strong) UIPinchGestureRecognizer *pinchGesture;
@property (nonatomic, strong) UILongPressGestureRecognizer *longPressGesture;


@end
@implementation AwesomeFloatingToolbar

- (instancetype) initWithFourTitles:(NSArray *)titles {
       // First, call the superclass (UIView)'s initializer, to make sure we do all that setup first.
    
    NSMutableArray *buttonsArray = [[NSMutableArray alloc] init];
    
    self = [super init];
    if (self)
    {
        self.currentTitles = titles;
        self.colors = @[[UIColor colorWithRed:199/255.0 green:158/255.0 blue:203/255.0 alpha:1],
        [UIColor colorWithRed:255/255.0 green:105/255.0 blue:97/255.0 alpha:1],
        [UIColor colorWithRed:222/255.0 green:165/255.0 blue:164/255.0 alpha:1],
        [UIColor colorWithRed:255/255.0 green:179/255.0 blue:71/255.0 alpha:1]];
        
        
             // Make the 4 labels
         for (NSString *currentTitle in self.currentTitles) {
            UIButton *button = [[UIButton alloc] init];
            //label.userInteractionEnabled = NO;
            button.alpha = 0.25;
            
            NSUInteger currentTitleIndex = [self.currentTitles indexOfObject:currentTitle]; // 0 through 3
            NSString *titleForThisLabel = [self.currentTitles objectAtIndex:currentTitleIndex];
            UIColor *colorForThisLabel = [self.colors objectAtIndex:currentTitleIndex];
            
            //label.textAlignment = NSTextAlignmentCenter;
            //button.font = [UIFont systemFontOfSize:10];
            button.titleLabel.text = titleForThisLabel;
             [button setTitle:titleForThisLabel forState:UIControlStateNormal];
             button.backgroundColor = colorForThisLabel;
            button.titleLabel.textColor = [UIColor whiteColor];
           
            [buttonsArray addObject:button];
         }
        self.buttons = buttonsArray;
        
        for (UIButton *thisButton in self.buttons) {
            [self addSubview:thisButton];
        }
        
        self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapFired:)];
        [self addGestureRecognizer:self.tapGesture];
        
        self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panFired:)];
        [self addGestureRecognizer:self.panGesture];
        
        self.pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchFired:)];
        [self addGestureRecognizer:self.pinchGesture];
        
        self.longPressGesture =[[UILongPressGestureRecognizer alloc ] initWithTarget:self action:@selector(longPressFired:) ];
        [self addGestureRecognizer:self.longPressGesture];
        
    }
  
    
    
    return self;
}

/*  *************  the firing section *************/

- (void) tapFired:(UITapGestureRecognizer *)recognizer {
    if (recognizer.state == UIGestureRecognizerStateRecognized) { // #3
        CGPoint location = [recognizer locationInView:self]; // #4
        UIView *tappedView = [self hitTest:location withEvent:nil]; // #5
        if ([self.buttons containsObject:tappedView]) { // #6
            if ([self.delegate respondsToSelector:@selector(floatingToolbar:didSelectButtonWithTitle:)]) {
                [self.delegate floatingToolbar:self didSelectButtonWithTitle:((UILabel *)tappedView).text];
            }
        }
    }
}


- (void) panFired:(UIPanGestureRecognizer *)recognizer {
    if (recognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [recognizer translationInView:self];
        NSLog(@"New translation: %@", NSStringFromCGPoint(translation));
        if ([self.delegate respondsToSelector:@selector(floatingToolbar:didTryToPanWithOffset:)]) {
            [self.delegate floatingToolbar:self didTryToPanWithOffset:translation];
        }
        [recognizer setTranslation:CGPointZero inView:self];
    }


}


- (void) pinchFired:(UIPinchGestureRecognizer *)recognizer {
    if (recognizer.state == UIGestureRecognizerStateChanged) {
        CGFloat scale = [recognizer scale];
        
        if ([self.delegate respondsToSelector:@selector(floatingToolbar:didPinchWithScale:)]) {
            [self.delegate floatingToolbar:self didPinchWithScale:scale];
        }
    }
}
    
    
- (void) longPressFired:(UILongPressGestureRecognizer *)recognizer {
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        int lowerBound = 0;
        int upperBound = 3;
        NSInteger randomValue = lowerBound + arc4random() % (upperBound - lowerBound);
        for (UIButton *button in self.buttons) {
            if (randomValue > upperBound) {
                randomValue = 0;
            }
            button.backgroundColor = self.colors[randomValue];
            randomValue++;
        }
    }
}



- (void) layoutSubviews {
    // set the frames for the 4 labels
    
     for (UIButton *thisButton in self.buttons) {
        NSUInteger currentLabelIndex = [self.buttons indexOfObject:thisButton];
        
        CGFloat labelHeight = CGRectGetHeight(self.bounds) / 2;
        CGFloat labelWidth = CGRectGetWidth(self.bounds) / 2;
        CGFloat labelX = 0;
        CGFloat labelY = 0;
    
        // adjust labelX and labelY for each label
        if (currentLabelIndex < 2) {
            // 0 or 1, so on top
            labelY = 0;
            } else {
                // 2 or 3, so on bottom
                labelY = CGRectGetHeight(self.bounds) / 2;
                }
        
        if (currentLabelIndex % 2 == 0) { // is currentLabelIndex evenly divisible by 2?// 0 or 2, so on the left
            labelX = 0;
            } else {
                // 1 or 3, so on the right
                labelX = CGRectGetWidth(self.bounds) / 2;
                }
    
        thisButton.frame = CGRectMake(labelX, labelY, labelWidth, labelHeight);
        }
    }

#pragma mark - Touch Handling

- (UILabel *) labelFromTouches:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    UIView *subview = [self hitTest:location withEvent:event];

    if ([subview isKindOfClass:[UILabel class]]) {
        return (UILabel *)subview;
    } else
    {
        return nil;
    }
}
/* MRUTHERF - removed in 25
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UILabel *label = [self labelFromTouches:touches withEvent:event];
    self.currentLabel = label;
    self.currentLabel.alpha = 0.5;
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UILabel *label = [self labelFromTouches:touches withEvent:event];

    if (self.currentLabel != label) {
        // The label being touched is no longer the initial label
        self.currentLabel.alpha = 1;
    } else {
        // The label being touched is the initial label
        self.currentLabel.alpha = 0.5;
    }
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UILabel *label = [self labelFromTouches:touches withEvent:event];

    if (self.currentLabel == label) {
        NSLog(@"Label tapped: %@", self.currentLabel.text);
        
        if ([self.delegate respondsToSelector:@selector(floatingToolbar:didSelectButtonWithTitle:)]) {
            [self.delegate floatingToolbar:self didSelectButtonWithTitle:self.currentLabel.text];
        }
    }

    self.currentLabel.alpha = 1;
    self.currentLabel = nil;
}


- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    self.currentLabel.alpha = 1;
    self.currentLabel = nil;
}
*/

#pragma mark - Button Enabling

- (void) setEnabled:(BOOL)enabled forButtonWithTitle:(NSString *)title {
    NSUInteger index = [self.currentTitles indexOfObject:title];

    if (index != NSNotFound) {
        UIButton *button = [self.buttons objectAtIndex:index];
        //label.userInteractionEnabled = enabled;
        button.enabled = YES;
        button.alpha = enabled ? 1.0 : 0.25;
    }
}




@end