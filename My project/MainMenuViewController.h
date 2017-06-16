//
//  MainMenuViewController.h
//  My project
//
//  Created by user on 22.07.15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainMenuViewController <NSObject>

@end

@interface MainMenuViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;


@property (weak) id <MainMenuViewController> delegate;



@end
