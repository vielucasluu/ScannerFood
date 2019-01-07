//
//  VW_EditView.m
//  ScanerFood
//
//  Created by Lucas Luu on 8/9/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import "VW_ReviewView.h"
#import "VC_MainPageSpaceDetails.h"

@interface VW_ReviewView()

{
    FIRDatabaseReference* _firebaseRef;
}

@property (strong, nonatomic) NSString*     spaceID;
@property (strong, nonatomic) NSString*     keyString;
@property (strong, nonatomic) UITextView*   commentView;
@property (strong, nonatomic) UIButton*     submitBtn;

@property (strong, nonatomic) UIView*       nonLoginView;
@property (strong, nonatomic) UILabel*      loginRequiredLabel;
@property (strong, nonatomic) UIButton*     loginBtn;

@end

@implementation VW_ReviewView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setBackgroundColor:[UIColor lightGrayColor]];
        _firebaseRef = FIRDatabase.database.reference;

        _submitBtn = [[UIButton alloc] init];
        [_submitBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_submitBtn setBackgroundColor:[UIColor blackColor]];
        [_submitBtn setTitle:@"Submit" forState:UIControlStateNormal];
        [_submitBtn addTarget:self action:@selector(addReview) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_submitBtn];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_submitBtn
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_submitBtn
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_submitBtn
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_submitBtn
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                          constant:-50.0]];
        
        _commentView = [[UITextView alloc] init];
        [self addSubview:_commentView];
        [_commentView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_commentView
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_commentView
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_commentView
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_commentView
                                                         attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeHeight
                                                        multiplier:1.0
                                                          constant:-70.0]];
        
        
        [self createInputAccessoryView];
        
        _nonLoginView = [[UIView alloc] init];
        [_nonLoginView setHidden:NO];
        [_nonLoginView setBackgroundColor:[UIColor whiteColor]];
        [_nonLoginView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:_nonLoginView];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_nonLoginView
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_nonLoginView
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_nonLoginView
                                                         attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeHeight
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_nonLoginView
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:1.0
                                                          constant:0.0]];
        
        _loginRequiredLabel = [[UILabel alloc] init];
        [_loginRequiredLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_loginRequiredLabel setTextAlignment:NSTextAlignmentCenter];
        [_loginRequiredLabel setNumberOfLines:0];
        [_loginRequiredLabel setText:@"Bạn phải đăng nhập để sử dụng tính năng này"];
        [_nonLoginView addSubview:_loginRequiredLabel];
        [_nonLoginView addConstraint:[NSLayoutConstraint constraintWithItem:_loginRequiredLabel
                                                                  attribute:NSLayoutAttributeCenterX
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:_nonLoginView
                                                                  attribute:NSLayoutAttributeCenterX
                                                                 multiplier:1.0
                                                                   constant:0.0]];
        [_nonLoginView addConstraint:[NSLayoutConstraint constraintWithItem:_loginRequiredLabel
                                                                  attribute:NSLayoutAttributeCenterY
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:_nonLoginView
                                                                  attribute:NSLayoutAttributeCenterY
                                                                 multiplier:1.0
                                                                   constant:0.0]];
        [_nonLoginView addConstraint:[NSLayoutConstraint constraintWithItem:_loginRequiredLabel
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:_nonLoginView
                                                                  attribute:NSLayoutAttributeWidth
                                                                 multiplier:1.0
                                                                   constant:0.0]];
        [_nonLoginView addConstraint:[NSLayoutConstraint constraintWithItem:_loginRequiredLabel
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:_nonLoginView
                                                                  attribute:NSLayoutAttributeHeight
                                                                 multiplier:0.0
                                                                   constant:50.0]];
        
        _loginBtn = [[UIButton alloc] init];
        [_loginBtn.layer setCornerRadius:5];
        [_loginBtn.layer setBorderWidth:0.75];
        [_loginBtn setTintColor:[UIColor blackColor]];
        [_loginBtn setTitleColor:[UIColor  blackColor] forState:UIControlStateNormal];
        [_loginBtn setTitle:@"Login" forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(loginButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [_loginBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_nonLoginView addSubview:_loginBtn];
        [_nonLoginView addConstraint:[NSLayoutConstraint constraintWithItem:_loginBtn
                                                                  attribute:NSLayoutAttributeCenterX
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:_nonLoginView
                                                                  attribute:NSLayoutAttributeCenterX
                                                                 multiplier:1.0
                                                                   constant:0.0]];
        [_nonLoginView addConstraint:[NSLayoutConstraint constraintWithItem:_loginBtn
                                                                  attribute:NSLayoutAttributeCenterY
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:_nonLoginView
                                                                  attribute:NSLayoutAttributeCenterY
                                                                 multiplier:1.0
                                                                   constant:80.0]];
        [_nonLoginView addConstraint:[NSLayoutConstraint constraintWithItem:_loginBtn
                                                                  attribute:NSLayoutAttributeRight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:_loginBtn
                                                                  attribute:NSLayoutAttributeLeft
                                                                 multiplier:1.0
                                                                   constant:100.0]];
        [_nonLoginView addConstraint:[NSLayoutConstraint constraintWithItem:_loginBtn
                                                                  attribute:NSLayoutAttributeBottom
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:_loginBtn
                                                                  attribute:NSLayoutAttributeTop
                                                                 multiplier:1.0
                                                                   constant:50.0]];
        
        [self reloadUI];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadUI) name:@"kUserSignedIn" object:nil];
        
    }
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)createInputAccessoryView
{
    UIToolbar* keyboardToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 44)];
    keyboardToolbar.barStyle = UIBarStyleDefault;
    //    keyboardToolbar.tintColor = [UIColor darkGrayColor];
    UIBarButtonItem* flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneTyping)];
    
    [keyboardToolbar setItems:@[flexSpace,doneButton] animated:NO];
    [_commentView setInputAccessoryView:keyboardToolbar];
}

-(void)doneTyping
{
    [self endEditing:YES];
}

-(void)setSpaceID:(NSString *)spaceID
{
    NSLog(@"");
    _spaceID = spaceID;
}

-(void)setKeyString:(NSString*)keyString
{
    _keyString = keyString;
}

-(void)addReview
{
    if ([_commentView.text isEqualToString:@""]) {
        return;
    }
    
    User* userData = [_AppDataHandler user];
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString* date = [dateFormatter stringFromDate:[NSDate date]];
    
    NSString *key = [[[_firebaseRef child:_keyString] child:_spaceID] childByAutoId].key;
    NSDictionary *post = @{@"date": date,
                           @"author": userData.userID,
                           @"content": _commentView.text};
    NSDictionary *childUpdates = @{[@"/reviews/" stringByAppendingString:key]: post};
    [[[_firebaseRef child:_keyString] child:_spaceID] updateChildValues:childUpdates withCompletionBlock:^(NSError * _Nullable error, FIRDatabaseReference * _Nonnull ref) {
        if (!error) {
            UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"Update Successfull"
                                                                             message:@"Review has been updated!"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK"
                                                               style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction * _Nonnull action) {
                                                                 [alertVC dismissViewControllerAnimated:YES completion:nil];
                                                             }];
            [alertVC addAction:okAction];
            [_NavController presentViewController:alertVC animated:YES completion:nil];
            [self endEditing:YES];
        }
    }];
}

-(void)loginButtonTapped
{
    VC_MainPageHome* homeVC = [VC_MainPageHome shareInstance];
    [homeVC setSelectedIndex:1];
}

-(void)reloadUI
{
    if ([_AppDataHandler user])
    {
        [_nonLoginView setHidden:YES];
    }
}

@end
