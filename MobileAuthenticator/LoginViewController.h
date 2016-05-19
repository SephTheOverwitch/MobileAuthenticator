//
//  ViewController.h
//  MobileAuthenticator
//
//  Created by Infinum on 17/04/16.
//  Copyright © 2016 Infinum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Valet/Valet.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *identifyButton;
@property (nonatomic, strong) VALValet *myValet;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *enableTouchIDButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (nonatomic, strong) NSString *authKey;
@property (nonatomic, strong) NSMutableArray *passList;
@property (nonatomic, strong) NSString *firstObject;

@end

