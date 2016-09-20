//
//  ScopedCostTimeHelper.h
//  faceIOS
//
//  Created by yichaohuang on 16/4/7.
//  Copyright © 2016年 tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <vector>
#include <string>

#define kSpecialCostIdStart "start"

#define TIMER_START(obj, prefix) ScopeTimer obj(prefix);\
    obj.startRecord();

#define TIMER_TICK(obj, costId) obj.addRecord(costId);

class ScopeTimer {
public:
    ScopeTimer(const std::string &prefix);
    virtual ~ScopeTimer();
    void startRecord();
    void addRecord(const std::string& costId);
    std::string getRecordStr();
private:
    void printRecord();
    std::vector<std::string> _costIdArray;
    std::vector<double> _costTimeArray;
    std::string _prefix;
};


