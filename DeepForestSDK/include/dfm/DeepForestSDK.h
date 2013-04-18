//
//  DeepForestSDK
//  Deep Forest Media iOS SDK
//
//  Copyright (c) 2013 Deep Forest Media, Inc. All Rights Reserved.
//

#import <Foundation/Foundation.h>

#define DF_START_TIMER                  @"START_TIMER"
#define DF_END_TIMER                    @"END_TIMER"

@class SKPayment;
@class SKProduct;

/*!
 *  @brief SDK methods for sending events from your app to Deep Forest Media. 
 *
 *  Set of methods capturing and sending launch, action and purchase events arising
 *  from the use of your app by end users.
 *
 *  @author 2013 Deep Forest Media, Inc. All Rights Reserved.
 *  @version 1.0
 */
@interface DeepForestSDK : NSObject

/*!
 *  @brief Initializes the SDK for the app identified by @c appID and sends a launch event.
 *
 *  This method is the entry point for the Deep Forest Media SDK. It initializes the SDK for
 *  the app identified by @c appID and authenticated by @c secretKey. It sends a launch event
 *  to Deep Forest Media. It must be called from @c applicationDidFinishLaunching method in 
 *  the @c AppDelegate.
 *
 * @code
 *  - (void)applicationDidFinishLaunching:(UIApplication *)application
 *  {
 *     // ...
 *     [DeepForestSDK initWithAppId:@"YOUR_APP_ID" secretKey:@"YOUR_SECRET_KEY"];
 *     // ...
 *  }
 * @endcode
 *
 *  @param appID The appID for your application.
 *  @param secretKey The secret for your application.
 */
+ (void)initWithAppId:(NSString *)appID secretKey:(NSString *)secretKey;

/*!
 *  @brief Sends an action event.
 *
 *  Sends an action event to Deep Forest Media. It can be called from anywhere in your 
 *  application anytime after @c initWithAppId was called.
 *
 * @code
 *     // ...
 *     [DeepForestSDK logAction:@"ACTION_NAME"];
 *     // ...
 * @endcode
 *
 *  @param actionName An action name.
 */
+ (void)logAction:(NSString *)actionName;

/*!
 *  @brief Sends an action event with parameters.
 *
 *  Sends an action event with parameters to Deep Forest Media. It can be called from anywhere
 *  in your application anytime after @c initWithAppId was called.
 *
 * @code
 *     // ...
 *     NSDictionary *parameters = [[NSDictionary alloc] init];
 *     [parameters setValue:@"YOUR_VALUE" forKey:@"YOUR_KEY"];
 *     // ...
 *     [DeepForestSDK logAction:@"ACTION_NAME" withParameters:parameters];
 *     // ...
 * @endcode
 *
 *  @param actionName An action name.
 *  @param parameters Custom parameters.
 */
+ (void)logAction:(NSString *)actionName withParameters:(NSDictionary *)parameters;

/*!
 *  @brief Sends an action event with parameters and starts or stops timer.
 *
 *  Sends an action event with parameters and a start or stop timer switch to Deep Forest Media. 
 *  It can be called from anywhere in your application anytime after @c initWithAppId was called.
 *
 * @code
 *     // ...
 *     NSDictionary *parameters = [[NSDictionary alloc] init];
 *     [parameters setValue:@"YOUR_VALUE" forKey:@"YOUR_KEY"];
 *     // ...
 *     [DeepForestSDK logAction:@"ACTION_NAME" withParameters:parameters andTimerSwitch:DF_START_TIMER];
 *     // ... Note that"parameters" used with DF_END_TIMER could be different from that used with DF_START_TIMER
 *     [DeepForestSDK logAction:@"ACTION_NAME" withParameters:parameters andTimerSwitch:DF_END_TIMER];
 *     // ...
 * @endcode
 *
 *  @param actionName An action name.
 *  @param parameters Custom parameters.
 *  @param timerSwitch Start or stop the timer.
 */
+ (void)logAction:(NSString *)actionName withParameters:(NSDictionary *)parameters andTimerSwitch:(NSString *)timerSwitch;

/*!
 *  @brief Sends a purchase event.
 *
 *  Sends a purchase event for a payment corresponding to a product to Deep Forest Media. The developer 
 *  is responsible for supplying a product that corresponds to the payment. If the @c product is @c nil
 *  or if it does not correspond to the @c payment, then the purchase event is transmitted without any
 *  price information. This method must be called from within the @c – paymentQueue:updatedTransactions
 *  method of a @c SKPaymentTransactionObserver delegate, anytime after the @c initWithAppId was called.
 *
 * @code
 *  - (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions {
 *     for (SKPaymentTransaction *transaction in transactions) {
 *         // ...
 *         switch (transaction.transactionState) {
 *             case SKPaymentTransactionStatePurchased:
 *                 // ...
 *                 [DeepForestSDK logPurchase:transaction.payment ofProduct:product];
 *                 // Note that the developer is reponsible for providing a product that corresponds to 
 *                 // the payment.
 *                 // ...
 *                 break;
 *             //...
 *         }
 *         // ...
 *  }
 * @endcode
 *
 *  @param payment An app store payment object.
 *  @param product A product object
 */
+ (void)logPurchase:(SKPayment *)payment ofProduct:(SKProduct *)product;

@end

