//
//  EAPasscodeLock.m
//  EAPasscodeLock
//
//  Created by Ezequiel Leonardo Aceto on 6/22/12.
//  Copyright (c) 2012 Xenat. All rights reserved.
//

#import "EAPasscodeLock.h"
#import "EAPasscodeLockViewController.h"
#import "EAPasscodeLockProtocol.h"

@implementation EAPasscodeLock


-(UIViewController*) passcodeViewControllerWithCode:(NSString*)code delegate:(id<EAPasscodeLockProtocol>) _passcodeDelegate
{
    return [self passcodeViewControllerWithCode:code cancellable:YES hintText:nil maxRetries:0 delegate:_passcodeDelegate];
}

-(UIViewController*) passcodeViewControllerWithCode:(NSString*)code cancellable:(BOOL)cancellable delegate:(id<EAPasscodeLockProtocol>) _passcodeDelegate
{
    return [self passcodeViewControllerWithCode:code cancellable:cancellable hintText:nil maxRetries:0 delegate:_passcodeDelegate];    
}

-(UIViewController*) passcodeViewControllerWithCode:(NSString*)code cancellable:(BOOL)cancellable hintText:(NSString*)hintText  maxRetries:(int)retries delegate:(id<EAPasscodeLockProtocol>) _passcodeDelegate
{
    EAPasscodeLockViewController* passcodeViewController = nil;        
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"PasscodeResources" ofType:@"bundle"];
    NSBundle *passcodeBundle = [NSBundle bundleWithPath:bundlePath];
    
    NSLog(@"%@",[passcodeBundle pathForResource:@"EAPasscodeLockViewController" ofType:@"nib"]);
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        passcodeViewController= [[EAPasscodeLockViewController alloc] initWithNibName:@"EAPasscodeLockViewController_iPhone" bundle:passcodeBundle];
    }
    else
    {
        passcodeViewController= [[EAPasscodeLockViewController alloc] initWithNibName:@"EAPasscodeLockViewController_iPad" bundle:passcodeBundle];
    }
    
    [passcodeViewController setUnlockCode:code];
    [passcodeViewController setPasscodeDelegate:_passcodeDelegate];
    [passcodeViewController setMaxRetries:retries];
    [passcodeViewController setCancellable:cancellable];
    [passcodeViewController setHintText:hintText];

    return passcodeViewController;
}
@end
