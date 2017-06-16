//
//  CardsViewController.h
//  My project
//
//  Created by user on 27.07.15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CardsViewController <NSObject>


@end

@interface CardsViewController : UIViewController

@property (weak) id<CardsViewController> delegate;
@property (nonatomic) NSInteger choosenType;

@end
