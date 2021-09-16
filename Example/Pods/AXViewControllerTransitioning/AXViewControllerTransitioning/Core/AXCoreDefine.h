//
//  AXCoreDefine.h
//  AXiOSKit
//
//  Created by liuweixing 2018/6/4.
//  Copyright © 2018年 AX. All rights reserved.
//

#ifndef AXCoreDefine_h
#define AXCoreDefine_h

///**presented 动画时间*/
//#define AX_ALERT_PRESENTED_TIME 0.3f
//
///**dismissed 动画时间*/
//#define AX_ALERT_DISMISSED_TIME 0.1f

@protocol AXBaseAlertDataSource <NSObject>

@optional

- (CGSize)sizeForAlert;

@end


#endif /* AXCoreDefine_h */
