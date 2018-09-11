//
//  VW_SignInView.m
//  ScanerFood
//
//  Created by Lucas Luu on 9/7/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import "VW_SignInView.h"

@interface VW_SignInView()<UITextFieldDelegate, ApplicationDataHandlerDelegate>

@property (strong, nonatomic) UIImageView* logo;
@property (strong, nonatomic) UIButton* signInBtn;

@end

@implementation VW_SignInView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor whiteColor]];
        
        UIGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doneTyping)];
        [self addGestureRecognizer:singleTap];
        
        _logo = [[UIImageView alloc] init];
        [_logo setImage:[UIImage imageNamed:@"lunch_image_icon"]];
        [_logo setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:_logo];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_logo
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:100.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_logo
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_logo
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:0.4
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_logo
                                                         attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_logo
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:1.0
                                                          constant:0.0]];
        
        _userName = [[UITextField alloc] init];
        [_userName setDelegate:self];
        [_userName setPlaceholder:@"   user name"];
        [_userName.layer setBorderWidth:0.5];
        [_userName.layer setBorderColor:[UIColor blackColor].CGColor];
        [_userName.layer setCornerRadius:10];
        [_userName setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [_userName setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:_userName];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_userName
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_logo
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                          constant:50.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_userName
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_userName
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:0.6
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_userName
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_userName
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:50.0]];
        _password = [[UITextField alloc] init];
        [_password setDelegate:self];
        [_password setPlaceholder:@"   password"];
        [_password.layer setBorderWidth:0.5];
        [_password.layer setBorderColor:[UIColor blackColor].CGColor];
        [_password.layer setCornerRadius:10];
        [_password setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [_password setSecureTextEntry:YES];
        [_password setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:_password];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_password
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_userName
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                          constant:10.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_password
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_password
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:0.6
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_password
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_password
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:50.0]];
        _signInBtn = [[UIButton alloc] init];
        [_signInBtn addTarget:self action:@selector(signInButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [_signInBtn setTitle:@"Sign In" forState:UIControlStateNormal];
        [_signInBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_signInBtn setBackgroundColor:[UIColor lightGrayColor]];
        [_signInBtn.layer setBorderWidth:0.5];
        [_signInBtn.layer setBorderColor:[UIColor blackColor].CGColor];
        [_signInBtn.layer setCornerRadius:10];
        [_signInBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:_signInBtn];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_signInBtn
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_password
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                          constant:10.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_signInBtn
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_signInBtn
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:0.6
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_signInBtn
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_signInBtn
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:50.0]];
        [self createInputAccessoryView];
    }
    return self;
}

-(void)createInputAccessoryView
{
    UIToolbar* keyboardToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 44)];
    keyboardToolbar.barStyle = UIBarStyleDefault;
    //    keyboardToolbar.tintColor = [UIColor darkGrayColor];
    UIBarButtonItem* flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneTyping)];
    
    [keyboardToolbar setItems:@[flexSpace,doneButton] animated:NO];
    [_userName setInputAccessoryView:keyboardToolbar];
    [_password setInputAccessoryView:keyboardToolbar];
}

-(void)doneTyping
{
    [self endEditing:YES];
}

-(void)signInButtonTapped
{
    [_AppDataHandler signInWithUserName:_userName.text password:_password.text sender:self];
}

#pragma mark - UITextFieldDelegate
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    return YES;
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    [self endEditing:YES];
    return YES;
}


- (void)keyboardDidShow:(NSNotification *)notification
{
    // Assign new frame to your view
   [UIView animateWithDuration:0.5
                    animations:^{
                        CGRect frame = self.bounds;
                        frame.origin.y -= 110;
                        [self setFrame:frame];
                    }];
    
}

-(void)keyboardDidHide:(NSNotification *)notification
{
    [UIView animateWithDuration:0.5
                     animations:^{
                         CGRect frame = self.bounds;
                         frame.origin.y = 0;
                         [self setFrame:frame];
                     }];
}

#pragma mark - ApplicationDataHandlerDelegate
-(void)LVLDataRequestComplete:(id)responseValue
{
    if ([responseValue isKindOfClass:[User class]]) {
        [self setHidden:YES];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"kUserSignedIn" object:nil];
    }
    else
    {
        UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"Login Fail"
                                                                         message:@"Fail to login, please check you email/password"
                                                                  preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             [alertVC dismissViewControllerAnimated:YES completion:nil];
                                                         }];
        [alertVC addAction:okAction];
        [_NavController presentViewController:alertVC animated:YES completion:nil];
    }
}

@end
