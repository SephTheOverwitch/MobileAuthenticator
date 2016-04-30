//
//  PinGenerationController.m
//  MobileAuthenticator
//
//  Created by Infinum on 18/04/16.
//  Copyright © 2016 Infinum. All rights reserved.
//

#import "PinGenerationController.h"
#import "LoginViewController.h"

@implementation PinGenerationController

- (IBAction)submitPINClicked:(id)sender {
    
    if([self validateInput]){        //Gotova identifikacija, disejblat identify button
        identificationDone = YES;
        LoginViewController *home = (LoginViewController *)[self.navigationController.viewControllers objectAtIndex:0];
        [home.identifyButton setEnabled:false];
        
        //Pospremi negdje u Valet vrijednosti varijabli, da se zna za iduce pokretanje

        [self askForTouchID];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
        });
        
    }

}
-(void)askForTouchID{

        //Do you want to enable Touch ID?

        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Suggestion"
                                              message:@"Do you want to enable TouchID?"
                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {
                                       useTouchID = YES;
                                       [self.navigationController popToRootViewControllerAnimated:YES];

                                   }];
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"No", @"No action") style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            useTouchID = NO;
            [self.navigationController popToRootViewControllerAnimated:YES];
        }];
        [alertController addAction:okAction];
        [alertController addAction:noAction];
        [self.navigationController presentViewController:alertController animated:YES completion:nil];




}
-(bool)validateInput{
    if(!self.enterPINTextbox.hasText || [[self.enterPINTextbox.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]] length] == 0){
        
        [self presentAlert:EmptyInput];
    }
    else{
        if(![[self.enterPINTextbox.text stringByTrimmingCharactersInSet:
              [NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:[self.repeatPINTextbox.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]]])
        {
            [self presentAlert:PINMissmatch];
        }
        else{
            // ISPRAVAN UNOS
            // provjeriti da pin ima barem 6 znaka
            if([self.enterPINTextbox.text stringByTrimmingCharactersInSet:
                [NSCharacterSet whitespaceAndNewlineCharacterSet]].length < 6){
                [self presentAlert:TooShort];
            }

            
            return true;
        }
    }
    return false;
}


-(void)presentAlert:(NSInteger) type{
    
    switch (type) {
        case EmptyInput:
        {
            UIAlertController *alertController = [UIAlertController
                                                  alertControllerWithTitle:@"No input"
                                                  message:@"You need to type in the key."
                                                  preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction *action)
                                       {
                                           NSLog(@"OK action");
                                       }];
            [alertController addAction:okAction];
            [self presentViewController:alertController animated:YES completion:nil];
            break;
        }
        case PINMissmatch:
        {
            UIAlertController *alertController = [UIAlertController
                                                  alertControllerWithTitle:@"Error"
                                                  message:@"PIN Missmatch."
                                                  preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction *action)
                                       {
                                           NSLog(@"OK action");
                                       }];
            [alertController addAction:okAction];
            [self presentViewController:alertController animated:YES completion:nil];
            break;
        }
        case TooShort:
        {
            UIAlertController *alertController = [UIAlertController
                                                  alertControllerWithTitle:@"Error"
                                                  message:@"PIN too short."
                                                  preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction *action)
                                       {
                                           NSLog(@"OK action");
                                       }];
            [alertController addAction:okAction];
            [self presentViewController:alertController animated:YES completion:nil];
            break;
        }
            
        default:
            break;
    }
    
}


@end
