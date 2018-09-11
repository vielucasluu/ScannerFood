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
@property (strong, nonatomic) UITextView*   commentView;
@property (strong, nonatomic) UIButton*     submitBtn;

@property (strong, nonatomic) UIView*       nonLoginView;
@property (strong, nonatomic) UILabel*      loginRequiredLabel;
@property (strong, nonatomic) UIButton*     loginBtn;

@end

@implementation VW_ReviewView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor lightGrayColor]];
        _firebaseRef = FIRDatabase.database.reference;
        
        frame.origin.x = 10;
        frame.origin.y = 10;
        frame.size.height -= 70;
        frame.size.width -= 20;
        
        _commentView = [[UITextView alloc] initWithFrame:frame];
        [self addSubview:_commentView];
        
        CGRect btnFrame = CGRectMake(10, frame.size.height + 20, frame.size.width, 50);
        _submitBtn = [[UIButton alloc] initWithFrame:btnFrame];
        [_submitBtn setBackgroundColor:[UIColor yellowColor]];
        [_submitBtn setTitle:@"Submit" forState:UIControlStateNormal];
        [_submitBtn addTarget:self action:@selector(addReview) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_submitBtn];
        
        [self createInputAccessoryView];
        
        _nonLoginView = [[UIView alloc] initWithFrame:self.bounds];
        [_nonLoginView setHidden:NO];
        [_nonLoginView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_nonLoginView];
        
        _loginRequiredLabel = [[UILabel alloc] initWithFrame:frame];
        [_loginRequiredLabel setNumberOfLines:0];
        [_loginRequiredLabel setText:@"Bạn phải đăng nhập để sử dụng tính năng này"];
        [_nonLoginView addSubview:_loginRequiredLabel];
        
        _loginBtn = [[UIButton alloc] initWithFrame:btnFrame];
        [_loginBtn.layer setCornerRadius:5];
        [_loginBtn.layer setBorderWidth:0.75];
        [_loginBtn setTintColor:[UIColor blackColor]];
        [_loginBtn setTitleColor:[UIColor  blackColor] forState:UIControlStateNormal];
        [_loginBtn setTitle:@"Login" forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(loginButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [_nonLoginView addSubview:_loginBtn];
        
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

-(void)addReview
{
    if ([_commentView.text isEqualToString:@""]) {
        return;
    }
    
    User* userData = [_AppDataHandler userID];
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString* date = [dateFormatter stringFromDate:[NSDate date]];
    
    NSString *key = [[[_firebaseRef child:@"space_data"] child:_spaceID] childByAutoId].key;
    NSDictionary *post = @{@"date": date,
                           @"author": userData.userID,
                           @"content": _commentView.text};
    NSDictionary *childUpdates = @{[@"/reviews/" stringByAppendingString:key]: post};
    [[[_firebaseRef child:@"space_data"] child:_spaceID] updateChildValues:childUpdates withCompletionBlock:^(NSError * _Nullable error, FIRDatabaseReference * _Nonnull ref) {
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
    if ([_AppDataHandler userID])
    {
        [_nonLoginView setHidden:YES];
    }
}

@end
