//
//  EAViewController.h
//  EAPasscodeLockTest
//
//  Created by Ezequiel Leonardo Aceto on 6/22/12.
//  Copyright (c) 2012 Xenat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EAPasscodeLock.h"
#import "EAPasscodeLockProtocol.h"
#import "EAAccessGrantedViewController.h"

@interface EAViewController : UIViewController <EAPasscodeLockProtocol>
{
    BOOL unlocked;
}
-(IBAction)unlock:(id)sender;

@end
