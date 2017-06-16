//
//  MySingleton.h
//  My project
//
//  Created by user on 08.07.15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MySingleton : NSObject

@property (nonatomic, retain) NSString *someProperty;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *surname;
@property (strong, nonatomic) NSString *patronymicName;
@property (strong, nonatomic) NSString *email, *phoneNumber, *companyName, *ocupation, *adress;
@property (strong, nonatomic) NSString *website;
@property (strong, nonatomic) UIImage *profile;
@property (nonatomic) BOOL backSide;
@property (strong, nonatomic) UIImage *orderedImage1;
@property (strong, nonatomic) UIImage *orderedImage2;

@property (nonatomic) NSMutableArray *categoryImages1;
@property (nonatomic) NSMutableArray *categoryImages2;


@property (strong, nonatomic) UIImage *image1;
@property (strong, nonatomic) UIImage *image2;
@property (strong, nonatomic) UIImage *image3;
@property (strong, nonatomic) UIImage *image4;
@property (strong, nonatomic) UIImage *image5;


+ (instancetype)sharedManager;
+ (void) saveSingleton;



@end
