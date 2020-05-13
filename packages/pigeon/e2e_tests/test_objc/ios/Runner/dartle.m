// Autogenerated from Pigeon (v0.1.0-experimental.11), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import "dartle.h"
#import <Flutter/Flutter.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSDictionary *wrapResult(NSDictionary *result, FlutterError *error) {
  NSDictionary *errorDict = (NSDictionary *)[NSNull null];
  if (error) {
    errorDict = [NSDictionary
        dictionaryWithObjectsAndKeys:(error.code ? error.code : [NSNull null]), @"code",
                                     (error.message ? error.message : [NSNull null]), @"message",
                                     (error.details ? error.details : [NSNull null]), @"details",
                                     nil];
  }
  return [NSDictionary dictionaryWithObjectsAndKeys:(result ? result : [NSNull null]), @"result",
                                                    errorDict, @"error", nil];
}

@interface ACSearchReply ()
+ (ACSearchReply *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end
@interface ACSearchRequest ()
+ (ACSearchRequest *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end
@interface ACNested ()
+ (ACNested *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end

@implementation ACSearchReply
+ (ACSearchReply *)fromMap:(NSDictionary *)dict {
  ACSearchReply *result = [[ACSearchReply alloc] init];
  result.result = dict[@"result"];
  if ((NSNull *)result.result == [NSNull null]) {
    result.result = nil;
  }
  result.error = dict[@"error"];
  if ((NSNull *)result.error == [NSNull null]) {
    result.error = nil;
  }
  return result;
}
- (NSDictionary *)toMap {
  return [NSDictionary
      dictionaryWithObjectsAndKeys:(self.result ? self.result : [NSNull null]), @"result",
                                   (self.error ? self.error : [NSNull null]), @"error", nil];
}
@end

@implementation ACSearchRequest
+ (ACSearchRequest *)fromMap:(NSDictionary *)dict {
  ACSearchRequest *result = [[ACSearchRequest alloc] init];
  result.query = dict[@"query"];
  if ((NSNull *)result.query == [NSNull null]) {
    result.query = nil;
  }
  result.anInt = dict[@"anInt"];
  if ((NSNull *)result.anInt == [NSNull null]) {
    result.anInt = nil;
  }
  result.aBool = dict[@"aBool"];
  if ((NSNull *)result.aBool == [NSNull null]) {
    result.aBool = nil;
  }
  return result;
}
- (NSDictionary *)toMap {
  return [NSDictionary
      dictionaryWithObjectsAndKeys:(self.query ? self.query : [NSNull null]), @"query",
                                   (self.anInt ? self.anInt : [NSNull null]), @"anInt",
                                   (self.aBool ? self.aBool : [NSNull null]), @"aBool", nil];
}
@end

@implementation ACNested
+ (ACNested *)fromMap:(NSDictionary *)dict {
  ACNested *result = [[ACNested alloc] init];
  result.request = [ACSearchRequest fromMap:dict[@"request"]];
  if ((NSNull *)result.request == [NSNull null]) {
    result.request = nil;
  }
  return result;
}
- (NSDictionary *)toMap {
  return [NSDictionary
      dictionaryWithObjectsAndKeys:(self.request ? [self.request toMap] : [NSNull null]),
                                   @"request", nil];
}
@end

@interface ACFlutterSearchApi ()
@property(nonatomic, strong) NSObject<FlutterBinaryMessenger> *binaryMessenger;
@end

@implementation ACFlutterSearchApi
- (instancetype)initWithBinaryMessenger:(NSObject<FlutterBinaryMessenger> *)binaryMessenger {
  self = [super init];
  if (self) {
    self.binaryMessenger = binaryMessenger;
  }
  return self;
}

- (void)search:(ACSearchRequest *)input
    completion:(void (^)(ACSearchReply *, NSError *))completion {
  FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
      messageChannelWithName:@"dev.flutter.pigeon.FlutterSearchApi.search"
             binaryMessenger:self.binaryMessenger];
  NSDictionary *inputMap = [input toMap];
  [channel sendMessage:inputMap
                 reply:^(id reply) {
                   NSDictionary *outputMap = reply;
                   ACSearchReply *output = [ACSearchReply fromMap:outputMap];
                   completion(output, nil);
                 }];
}
@end
void ACNestedApiSetup(id<FlutterBinaryMessenger> binaryMessenger, id<ACNestedApi> api) {
  {
    FlutterBasicMessageChannel *channel =
        [FlutterBasicMessageChannel messageChannelWithName:@"dev.flutter.pigeon.NestedApi.search"
                                           binaryMessenger:binaryMessenger];
    if (api) {
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        ACNested *input = [ACNested fromMap:message];
        ACSearchReply *output = [api search:input error:&error];
        callback(wrapResult([output toMap], error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}
void ACApiSetup(id<FlutterBinaryMessenger> binaryMessenger, id<ACApi> api) {
  {
    FlutterBasicMessageChannel *channel =
        [FlutterBasicMessageChannel messageChannelWithName:@"dev.flutter.pigeon.Api.search"
                                           binaryMessenger:binaryMessenger];
    if (api) {
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        ACSearchRequest *input = [ACSearchRequest fromMap:message];
        ACSearchReply *output = [api search:input error:&error];
        callback(wrapResult([output toMap], error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}