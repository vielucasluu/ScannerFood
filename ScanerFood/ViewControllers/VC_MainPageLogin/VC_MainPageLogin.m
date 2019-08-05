//
//  VC_MainPageLogin.m
//  ScanerFood
//
//  Created by Lucas Luu on 7/24/19.
//  Copyright © 2019 Lucas Luu. All rights reserved.
//

#import <MessageUI/MessageUI.h>
#import "VC_MainPageLogin.h"
#import "Material-Swift.h"

#define _textSize               12

@interface VC_MainPageLogin ()<MFMailComposeViewControllerDelegate, ApplicationDataHandlerDelegate>
{
    UIImageView*    _logoImage;
    UILabel*        _welcomeTitle;
}

@property (strong, nonatomic) ErrorTextField*   email;
@property (strong, nonatomic) ErrorTextField*   password;
@property (strong, nonatomic) UIButton*         loginBtn;
@property (strong, nonatomic) UIButton*         loginAsGuest;
@property (strong, nonatomic) UIButton*         forgotPassword;

@end

@implementation VC_MainPageLogin

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    [self.view setBackgroundColor:[UIColor LVL_colorWithHexString:kToneColor andAlpha:1.0]];
    
    //    UIImage *backImage = [UIImage imageNamed:@"backArrowImage"];
    //    UIButton* backBtn = [[UIButton alloc] init];
    //    [backBtn addTarget:self action:@selector(backBtnTapped) forControlEvents:UIControlEventTouchUpInside];
    //    [backBtn setTintColor:[UIColor greenColor]];
    //    [backBtn setImage:backImage forState:UIControlStateNormal];
    //    [backBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    //    [self.view addSubview:backBtn];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:backBtn
    //                                                          attribute:NSLayoutAttributeTop
    //                                                          relatedBy:NSLayoutRelationEqual
    //                                                             toItem:self.view
    //                                                          attribute:NSLayoutAttributeTop
    //                                                         multiplier:1.0
    //                                                           constant:30.0]];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:backBtn
    //                                                          attribute:NSLayoutAttributeLeft
    //                                                          relatedBy:NSLayoutRelationEqual
    //                                                             toItem:self.view
    //                                                          attribute:NSLayoutAttributeLeft
    //                                                         multiplier:1.0
    //                                                           constant:17.0]];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:backBtn
    //                                                          attribute:NSLayoutAttributeRight
    //                                                          relatedBy:NSLayoutRelationEqual
    //                                                             toItem:backBtn
    //                                                          attribute:NSLayoutAttributeLeft
    //                                                         multiplier:1.0
    //                                                           constant:44.0]];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:backBtn
    //                                                          attribute:NSLayoutAttributeBottom
    //                                                          relatedBy:NSLayoutRelationEqual
    //                                                             toItem:backBtn
    //                                                          attribute:NSLayoutAttributeTop
    //                                                         multiplier:1.0
    //                                                           constant:44.0]];
    _logoImage = [[UIImageView alloc] init];
    [_logoImage setImage:[UIImage imageNamed:@"app_icon"]];
    [_logoImage setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_logoImage];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_logoImage
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:30.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_logoImage
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_logoImage
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.47
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_logoImage
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_logoImage
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:0.0]];
    _welcomeTitle = [[UILabel alloc] init];
    [_welcomeTitle setText:@"Welcome to Step.fi!"];
    [_welcomeTitle setFont:[UIFont boldSystemFontOfSize:18]];
    [_welcomeTitle setTextColor:[UIColor whiteColor]];
    [_welcomeTitle setTextAlignment:NSTextAlignmentCenter];
    [_welcomeTitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_welcomeTitle];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_welcomeTitle
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_logoImage
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-20.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_welcomeTitle
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_welcomeTitle
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.8
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_welcomeTitle
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_welcomeTitle
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:20.0]];
    //    _descriptionLable = [[UILabel alloc] init];
    //    [_descriptionLable setText:@"Some thing over here to description about this app.This note because it will be replace soon"];
    //    [_descriptionLable setFont:[UIFont italicSystemFontOfSize:14]];
    //    [_descriptionLable setTextAlignment:NSTextAlignmentCenter];
    //    [_descriptionLable setNumberOfLines:2];
    //    [_descriptionLable setTranslatesAutoresizingMaskIntoConstraints:NO];
    ////    [self.view addSubview:_descriptionLable];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_descriptionLable
    //                                                                 attribute:NSLayoutAttributeTop
    //                                                                 relatedBy:NSLayoutRelationEqual
    //                                                                    toItem:_welcomeTitle
    //                                                                 attribute:NSLayoutAttributeBottom
    //                                                                multiplier:1.0
    //                                                                  constant:2.0]];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_descriptionLable
    //                                                                 attribute:NSLayoutAttributeCenterX
    //                                                                 relatedBy:NSLayoutRelationEqual
    //                                                                    toItem:self.view
    //                                                                 attribute:NSLayoutAttributeCenterX
    //                                                                multiplier:1.0
    //                                                                  constant:0.0]];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_descriptionLable
    //                                                                 attribute:NSLayoutAttributeWidth
    //                                                                 relatedBy:NSLayoutRelationEqual
    //                                                                    toItem:self.view
    //                                                                 attribute:NSLayoutAttributeWidth
    //                                                                multiplier:0.8
    //                                                                  constant:0.0]];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_descriptionLable
    //                                                                 attribute:NSLayoutAttributeBottom
    //                                                                 relatedBy:NSLayoutRelationEqual
    //                                                                    toItem:_descriptionLable
    //                                                                 attribute:NSLayoutAttributeTop
    //                                                                multiplier:1.0
    //                                                                  constant:50.0]];
    //    _changePassword = [[UILabel alloc] init];
    //    [_changePassword setText:@"Sign in"];
    //    [_changePassword setTextAlignment:NSTextAlignmentCenter];
    //    [_changePassword setFont:[UIFont boldSystemFontOfSize:14]];
    //    [_changePassword setTranslatesAutoresizingMaskIntoConstraints:NO];
    //    [self.view addSubview:_changePassword];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_changePassword
    //                                                                 attribute:NSLayoutAttributeTop
    //                                                                 relatedBy:NSLayoutRelationEqual
    //                                                                    toItem:_welcomeTitle
    //                                                                 attribute:NSLayoutAttributeBottom
    //                                                                multiplier:1.0
    //                                                                  constant:20.0]];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_changePassword
    //                                                                 attribute:NSLayoutAttributeCenterX
    //                                                                 relatedBy:NSLayoutRelationEqual
    //                                                                    toItem:self.view
    //                                                                 attribute:NSLayoutAttributeCenterX
    //                                                                multiplier:1.0
    //                                                                  constant:0.0]];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_changePassword
    //                                                                 attribute:NSLayoutAttributeWidth
    //                                                                 relatedBy:NSLayoutRelationEqual
    //                                                                    toItem:self.view
    //                                                                 attribute:NSLayoutAttributeWidth
    //                                                                multiplier:0.8
    //                                                                  constant:0.0]];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_changePassword
    //                                                                 attribute:NSLayoutAttributeBottom
    //                                                                 relatedBy:NSLayoutRelationEqual
    //                                                                    toItem:_changePassword
    //                                                                 attribute:NSLayoutAttributeTop
    //                                                                multiplier:1.0
    //                                                                  constant:30.0]];
    _email = [[ErrorTextField alloc] init];
    _email.placeholder = @"Email";
    _email.dividerNormalHeight = 0.5;
    _email.dividerActiveHeight = 1;
    _email.dividerActiveColor = [UIColor whiteColor];
    _email.placeholderActiveColor = [UIColor whiteColor];
    [_email setTextColor:[UIColor LVL_colorWithHexString:@"cdcccc" andAlpha:1.0]];
    [_email setFont:[UIFont systemFontOfSize:_textSize]];
    [_email setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [_email setAutocorrectionType:UITextAutocorrectionTypeNo];
    [_email setKeyboardType:UIKeyboardTypeEmailAddress];
    [_email setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_email];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_email
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_welcomeTitle
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:30.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_email
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_email
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:-60.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_email
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_email
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:20.0]];

    _password = [[ErrorTextField alloc] init];
    _password.placeholder = @"Password";
    _password.dividerNormalHeight = 0.5;
    _password.dividerActiveHeight = 1;
    _password.dividerActiveColor = [UIColor whiteColor];
    _password.placeholderActiveColor = [UIColor whiteColor];
    [_password setTextColor:[UIColor LVL_colorWithHexString:@"cdcccc" andAlpha:1.0]];
    [_password setFont:[UIFont systemFontOfSize:_textSize]];
    [_password setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [_password setAutocorrectionType:UITextAutocorrectionTypeNo];
    [_password setSecureTextEntry:YES];
    [_password setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_password];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_password
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_email
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:30.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_password
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_password
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:-60.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_password
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_password
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:20.0]];
    
    _forgotPassword = [[UIButton alloc] init];
    [_forgotPassword setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_forgotPassword setTitle:@"Quên mật khẩu?" forState:UIControlStateNormal];
    [_forgotPassword.titleLabel setFont:[UIFont italicSystemFontOfSize:_textSize]];
    _forgotPassword.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [_forgotPassword addTarget:self action:@selector(forgotPasswordButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [_forgotPassword setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_forgotPassword];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_forgotPassword
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_password
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:10.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_forgotPassword
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_password
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:0.0]];
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_forgotPassword
//                                                          attribute:NSLayoutAttributeLeft
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:_forgotPassword
//                                                          attribute:NSLayoutAttributeRight
//                                                         multiplier:1.0
//                                                           constant:-160.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_forgotPassword
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_forgotPassword
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:30.0]];
    UIView* forgotPasswrodLine = [[UIView alloc] init];
    forgotPasswrodLine.backgroundColor = [UIColor whiteColor];
    [forgotPasswrodLine setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:forgotPasswrodLine];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:forgotPasswrodLine
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_forgotPassword
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-3.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:forgotPasswrodLine
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_forgotPassword
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:forgotPasswrodLine
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_forgotPassword
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:0.0
                                                           constant:1.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:forgotPasswrodLine
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_forgotPassword
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    
    
    _loginBtn = [[UIButton alloc] init];
    [_loginBtn setTitle:@"Đăng nhập" forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginBtn.layer setCornerRadius:5];
    [_loginBtn.layer setMasksToBounds:YES];
    [_loginBtn setBackgroundColor:[UIColor LVL_colorWithHexString:@"aa4b16" andAlpha:1.0]];
    [_loginBtn addTarget:self action:@selector(loginButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [_loginBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_loginBtn];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_loginBtn
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_forgotPassword
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:25.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_loginBtn
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_loginBtn
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:-60.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_loginBtn
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_loginBtn
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:50.0]];
    
    _loginAsGuest = [[UIButton alloc] init];
    [_loginAsGuest setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginAsGuest setTitle:@"Bỏ qua đăng nhập" forState:UIControlStateNormal];
    [_loginAsGuest.titleLabel setFont:[UIFont italicSystemFontOfSize:_textSize+4]];
    _loginAsGuest.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_loginAsGuest addTarget:self action:@selector(loginAsGuestButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [_loginAsGuest setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_loginAsGuest];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_loginAsGuest
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_loginBtn
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:10.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_loginAsGuest
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_loginBtn
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_loginAsGuest
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_loginAsGuest
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:30.0]];
    
    UIView* guestLine = [[UIView alloc] init];
    guestLine.backgroundColor = [UIColor whiteColor];
    [guestLine setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:guestLine];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:guestLine
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_loginAsGuest
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-3.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:guestLine
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_loginAsGuest
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:guestLine
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_loginAsGuest
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:0.0
                                                           constant:1.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:guestLine
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_loginAsGuest
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    UIGestureRecognizer* singleTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTouchTapped)];
    [self.view addGestureRecognizer:singleTouch];
}

-(void)singleTouchTapped
{
    [self.view endEditing:YES];
}

-(void)forgotPasswordButtonTapped {
    if ([MFMailComposeViewController canSendMail]) {
        
        MFMailComposeViewController *mailVC = [[MFMailComposeViewController alloc] init];
        mailVC.mailComposeDelegate = self;
        [mailVC setSubject:@"[Step.fi] - Forgot password request !!"];
        [mailVC setToRecipients:@[@"nguyendaingoc@gmail.com"]];
        [mailVC setMessageBody:[NSString stringWithFormat:@"Account %@ của tôi bị quên mật khẩu, vui lòng hỗ trợ tôi",_email.text] isHTML:NO];
        [self presentViewController:mailVC animated:YES completion:nil];
        
    } else {
        //This device cannot send email
        UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"Lỗi mở mail"
                                                                         message:@"Không thể mở email tự động, vui lòng liên hệ nguyendaingoc@gmail.com"
                                                                  preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"Ok, đã hiểu"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             [alertVC dismissViewControllerAnimated:YES completion:nil];
                                                         }];
        [alertVC addAction:okAction];
        [_NavController presentViewController:alertVC animated:YES completion:nil];
    }
}

-(void)loginButtonTapped {
    if ([_email.text isEqualToString:@""]) {
        UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"Lỗi email"
                                                                         message:@"Email đăng nhập không được bỏ trống"
                                                                  preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"Ok, đã hiểu"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             [alertVC dismissViewControllerAnimated:YES completion:nil];
                                                         }];
        [alertVC addAction:okAction];
        [_NavController presentViewController:alertVC animated:YES completion:nil];
        return;
    }
    else if ([_password.text isEqualToString:@""]) {
        UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"Lỗi mật khẩu"
                                                                         message:@"Mật khẩu không được bỏ trống"
                                                                  preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"Ok, đã hiểu"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             [alertVC dismissViewControllerAnimated:YES completion:nil];
                                                         }];
        [alertVC addAction:okAction];
        [_NavController presentViewController:alertVC animated:YES completion:nil];
        return;
    }
    
    [_AppDataHandler signInWithUserName:_email.text
                               password:_password.text
                                 sender:self];
}

-(void)loginAsGuestButtonTapped {
    VC_MainPageSeach* homeVC = [VC_MainPageSeach alloc];
    [_NavController setViewControllers:@[homeVC] animated:true];
}


- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultSent:
            //Email sent
            break;
        case MFMailComposeResultSaved:
            //Email saved
            break;
        case MFMailComposeResultCancelled:
            //Handle cancelling of the email
            break;
        case MFMailComposeResultFailed:
            //Handle failure to send.
            break;
        default:
            //A failure occurred while completing the email
            break;
    }
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark ApplicationDataHandlerDelegate
-(void)LVLDataRequestComplete:(id)responseValue
{
    if ([responseValue isKindOfClass:[User class]]) {
        _AppDataHandler.user = (User*)responseValue;
        VC_MainPageSeach* searchVC = [VC_MainPageSeach shareInstance];
        [_NavController setViewControllers:@[searchVC] animated:true];
    }
    else {
        UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"Lỗi đăng nhập"
                                                                         message:@"Email hoặc mật khẩu không chính xác, vui lòng thử lại hoặc liên hệ Admin để hỗ trợ"
                                                                  preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"Ok, đã hiểu"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             [self.email setText:@""];
                                                             [self.password setText:@""];
                                                             [self.view endEditing:YES];
                                                             [alertVC dismissViewControllerAnimated:YES completion:nil];
                                                         }];
        [alertVC addAction:okAction];
        [_NavController presentViewController:alertVC animated:YES completion:nil];
    }
}

@end
