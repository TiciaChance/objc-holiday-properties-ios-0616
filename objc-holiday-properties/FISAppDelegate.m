//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
    
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    
    
    [self database];
    return [_database[season]allKeys];
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    
    return _database[season][holiday];
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    
    return [[_database[season] allKeys] containsObject:holiday];
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    
    return [_database[season][holiday] containsObject:supply];
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    
    //give holiday a new value of an empty mutable array
    
    NSMutableArray *forHolidayValue = [[NSMutableArray alloc] init];
    _database[season][holiday] = forHolidayValue;
    
    // no return
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
    [_database[season][holiday]addObject:supply];
    
    // no return
}

@end
