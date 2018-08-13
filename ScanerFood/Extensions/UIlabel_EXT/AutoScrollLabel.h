//
//  UILabel_EXT.h
//  ScanerFood
//
//  Created by Lucas Luu on 8/13/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoScrollLabel : UIView {
    UILabel *textLabel;
    NSTimer *timer;
}

- (void) setLabelText:(NSString*) text;
- (void) setLabelFont:(UIFont*)font;
- (void) setLabelTextColor:(UIColor*)color;
- (void) setLabelTextAlignment:(NSTextAlignment)alignment;
@end
