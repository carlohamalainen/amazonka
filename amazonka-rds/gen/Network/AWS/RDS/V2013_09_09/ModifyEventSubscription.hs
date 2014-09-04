{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.RDS.V2013_09_09.ModifyEventSubscription
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Modifies an existing RDS event notification subscription. Note that you
-- cannot modify the source identifiers using this call; to change source
-- identifiers for a subscription, use the AddSourceIdentifierToSubscription
-- and RemoveSourceIdentifierFromSubscription calls. You can see a list of the
-- event categories for a given SourceType in the Events topic in the Amazon
-- RDS User Guide or by using the DescribeEventCategories action.
-- https://rds.us-east-1.amazonaws.com/ ?Action=ModifyEventSubscription
-- &SubscriptionName=EventSubscription01 &EventCategories.member.1=creation
-- &EventCategories.member.2=deletion &SourceType=db-instance &Enabled=true
-- &Version=2013-01-10 &SignatureVersion=4 &SignatureMethod=HmacSHA256
-- &Timestamp=20130128T005359Z &AWSAccessKeyId= &Signature= true 012345678901
-- db-instance modifying 2013-01-28 00:29:23.736 creation deletion
-- EventSubscription01 arn:aws:sns:us-east-1:012345678901:EventSubscription01
-- 34907d48-68e5-11e2-98ef-2b071ac20a57.
module Network.AWS.RDS.V2013_09_09.ModifyEventSubscription
    (
    -- * Request
      ModifyEventSubscription
    -- ** Request constructor
    , modifyEventSubscription
    -- ** Request lenses
    , mesmSubscriptionName
    , mesmEnabled
    , mesmEventCategories
    , mesmSnsTopicArn
    , mesmSourceType

    -- * Response
    , ModifyEventSubscriptionResponse
    -- ** Response lenses
    , eszEventSubscription
    ) where

import Network.AWS.Request.Query
import Network.AWS.RDS.V2013_09_09.Types
import Network.AWS.Prelude

-- | Minimum specification for a 'ModifyEventSubscription' request.
modifyEventSubscription :: Text -- ^ 'mesmSubscriptionName'
                        -> ModifyEventSubscription
modifyEventSubscription p1 = ModifyEventSubscription
    { _mesmSubscriptionName = p1
    , _mesmEnabled = Nothing
    , _mesmEventCategories = mempty
    , _mesmSnsTopicArn = Nothing
    , _mesmSourceType = Nothing
    }
{-# INLINE modifyEventSubscription #-}

data ModifyEventSubscription = ModifyEventSubscription
    { _mesmSubscriptionName :: Text
      -- ^ The name of the RDS event notification subscription.
    , _mesmEnabled :: Maybe Bool
      -- ^ A Boolean value; set to true to activate the subscription.
    , _mesmEventCategories :: [Text]
      -- ^ A list of event categories for a SourceType that you want to
      -- subscribe to. You can see a list of the categories for a given
      -- SourceType in the Events topic in the Amazon RDS User Guide or by
      -- using the DescribeEventCategories action.
    , _mesmSnsTopicArn :: Maybe Text
      -- ^ The Amazon Resource Name (ARN) of the SNS topic created for event
      -- notification. The ARN is created by Amazon SNS when you create a
      -- topic and subscribe to it.
    , _mesmSourceType :: Maybe Text
      -- ^ The type of source that will be generating the events. For
      -- example, if you want to be notified of events generated by a DB
      -- instance, you would set this parameter to db-instance. if this
      -- value is not specified, all events are returned. Valid values:
      -- db-instance | db-parameter-group | db-security-group |
      -- db-snapshot.
    } deriving (Show, Generic)

-- | The name of the RDS event notification subscription.
mesmSubscriptionName :: Lens' ModifyEventSubscription (Text)
mesmSubscriptionName f x =
    f (_mesmSubscriptionName x)
        <&> \y -> x { _mesmSubscriptionName = y }
{-# INLINE mesmSubscriptionName #-}

-- | A Boolean value; set to true to activate the subscription.
mesmEnabled :: Lens' ModifyEventSubscription (Maybe Bool)
mesmEnabled f x =
    f (_mesmEnabled x)
        <&> \y -> x { _mesmEnabled = y }
{-# INLINE mesmEnabled #-}

-- | A list of event categories for a SourceType that you want to subscribe to.
-- You can see a list of the categories for a given SourceType in the Events
-- topic in the Amazon RDS User Guide or by using the DescribeEventCategories
-- action.
mesmEventCategories :: Lens' ModifyEventSubscription ([Text])
mesmEventCategories f x =
    f (_mesmEventCategories x)
        <&> \y -> x { _mesmEventCategories = y }
{-# INLINE mesmEventCategories #-}

-- | The Amazon Resource Name (ARN) of the SNS topic created for event
-- notification. The ARN is created by Amazon SNS when you create a topic and
-- subscribe to it.
mesmSnsTopicArn :: Lens' ModifyEventSubscription (Maybe Text)
mesmSnsTopicArn f x =
    f (_mesmSnsTopicArn x)
        <&> \y -> x { _mesmSnsTopicArn = y }
{-# INLINE mesmSnsTopicArn #-}

-- | The type of source that will be generating the events. For example, if you
-- want to be notified of events generated by a DB instance, you would set
-- this parameter to db-instance. if this value is not specified, all events
-- are returned. Valid values: db-instance | db-parameter-group |
-- db-security-group | db-snapshot.
mesmSourceType :: Lens' ModifyEventSubscription (Maybe Text)
mesmSourceType f x =
    f (_mesmSourceType x)
        <&> \y -> x { _mesmSourceType = y }
{-# INLINE mesmSourceType #-}

instance ToQuery ModifyEventSubscription where
    toQuery = genericQuery def

data ModifyEventSubscriptionResponse = ModifyEventSubscriptionResponse
    { _eszEventSubscription :: Maybe EventSubscription
      -- ^ Contains the results of a successful invocation of the
      -- DescribeEventSubscriptions action.
    } deriving (Show, Generic)

-- | Contains the results of a successful invocation of the
-- DescribeEventSubscriptions action.
eszEventSubscription :: Lens' ModifyEventSubscriptionResponse (Maybe EventSubscription)
eszEventSubscription f x =
    f (_eszEventSubscription x)
        <&> \y -> x { _eszEventSubscription = y }
{-# INLINE eszEventSubscription #-}

instance FromXML ModifyEventSubscriptionResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest ModifyEventSubscription where
    type Sv ModifyEventSubscription = RDS
    type Rs ModifyEventSubscription = ModifyEventSubscriptionResponse

    request = post "ModifyEventSubscription"
    response _ = xmlResponse
