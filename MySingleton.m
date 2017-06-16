//
//  MySingleton.m
//  My project
//
//  Created by user on 08.07.15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "MySingleton.h"

#define DATA_KEY @"datakey"
#define PROFILE_KEY @"profilekey"

@implementation MySingleton

#pragma mark Singleton methods

+(instancetype)sharedManager {
    static MySingleton *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    
    return sharedMyManager;
}

+ (void)saveSingleton
{
    MySingleton *sharedManager = [MySingleton sharedManager];
    
    NSMutableArray *dicts = [NSMutableArray new];

    dicts = [NSMutableArray arrayWithObjects: sharedManager.surname, sharedManager.name, sharedManager.patronymicName, sharedManager.email, sharedManager.phoneNumber, sharedManager.companyName, sharedManager.ocupation, sharedManager.adress, sharedManager.website,  nil];
//
//    NSLog(@"%@", sharedManager.name);
//    NSLog(@"%@", sharedManager.surname);
//    NSLog(@"%@", sharedManager.patronymicName);
//    NSLog(@"%@", sharedManager.email);
//    NSLog(@"%@", sharedManager.phoneNumber);
//    NSLog(@"%@", sharedManager.companyName);
//    NSLog(@"%@", sharedManager.ocupation);
//    NSLog(@"%@", sharedManager.adress);
//    NSLog(@"%@", sharedManager.website);
    
    [[NSUserDefaults standardUserDefaults] setObject:dicts forKey:DATA_KEY];
    [[NSUserDefaults standardUserDefaults] setObject:UIImagePNGRepresentation(sharedManager.profile) forKey: PROFILE_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}



-(id) init {
    if(self = [super init]){
        self.someProperty = @"Default Property Value";
    }
    return self;
}




- (void) dealloc {
    
}






@end
