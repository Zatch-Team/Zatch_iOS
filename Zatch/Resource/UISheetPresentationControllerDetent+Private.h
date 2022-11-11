//
//  UISheetPresentationControllerDetent+Private.h
//  Zatch
//
//  Created by 박지윤 on 2022/08/07.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UISheetPresentationControllerDetent (Private)
+ (UISheetPresentationControllerDetent *)_detentWithIdentifier:(NSString *)identifier constant:(CGFloat)constant;
@end

NS_ASSUME_NONNULL_END
