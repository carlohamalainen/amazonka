{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.SNS.V2010_03_31.ListPlatformApplications
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Lists the platform application objects for the supported push notification
-- services, such as APNS and GCM. The results for ListPlatformApplications
-- are paginated and return a limited list of applications, up to 100. If
-- additional records are available after the first page results, then a
-- NextToken string will be returned. To receive the next page, you call
-- ListPlatformApplications using the NextToken string received from the
-- previous call. When there are no more records to return, NextToken will be
-- null. For more information, see Using Amazon SNS Mobile Push Notifications.
-- POST http://sns.us-west-2.amazonaws.com/ HTTP/1.1 ...
-- Action=ListPlatformApplications &amp;SignatureMethod=HmacSHA256
-- &amp;AWSAccessKeyId=AKIAIOSFODNN7EXAMPLE &amp;SignatureVersion=2
-- &amp;Version=2010-03-31
-- &amp;Signature=drVbTuyR5N9e88WJMNPzBOjNFNvawkCaMfZI0xa9kIQ%3D
-- &amp;Timestamp=2013-07-01T22%3A33%3A55.618Z HTTP/1.1 200 OK ...
-- &lt;ListPlatformApplicationsResponse
-- xmlns="http://sns.amazonaws.com/doc/2010-03-31/"&gt;
-- &lt;ListPlatformApplicationsResult&gt; &lt;PlatformApplications&gt;
-- &lt;member&gt;
-- &lt;PlatformApplicationArn&gt;arn:aws:sns:us-west-2:123456789012:app/APNS_SANDBOX/apnspushapp&lt;/PlatformApplicationArn&gt;
-- &lt;Attributes&gt; &lt;entry&gt;
-- &lt;key&gt;AllowEndpointPolicies&lt;/key&gt;
-- &lt;value&gt;false&lt;/value&gt; &lt;/entry&gt; &lt;/Attributes&gt;
-- &lt;/member&gt; &lt;member&gt;
-- &lt;PlatformApplicationArn&gt;arn:aws:sns:us-west-2:123456789012:app/GCM/gcmpushapp&lt;/PlatformApplicationArn&gt;
-- &lt;Attributes&gt; &lt;entry&gt;
-- &lt;key&gt;AllowEndpointPolicies&lt;/key&gt;
-- &lt;value&gt;false&lt;/value&gt; &lt;/entry&gt; &lt;/Attributes&gt;
-- &lt;/member&gt; &lt;/PlatformApplications&gt;
-- &lt;/ListPlatformApplicationsResult&gt; &lt;ResponseMetadata&gt;
-- &lt;RequestId&gt;315a335e-85d8-52df-9349-791283cbb529&lt;/RequestId&gt;
-- &lt;/ResponseMetadata&gt; &lt;/ListPlatformApplicationsResponse&gt;.
module Network.AWS.SNS.V2010_03_31.ListPlatformApplications
    (
    -- * Request
      ListPlatformApplications
    -- ** Request constructor
    , listPlatformApplications
    -- ** Request lenses
    , lpaiNextToken

    -- * Response
    , ListPlatformApplicationsResponse
    -- ** Response lenses
    , lparPlatformApplications
    , lparNextToken
    ) where

import Network.AWS.Request.Query
import Network.AWS.SNS.V2010_03_31.Types
import Network.AWS.Prelude

-- | Minimum specification for a 'ListPlatformApplications' request.
listPlatformApplications :: ListPlatformApplications
listPlatformApplications = ListPlatformApplications
    { _lpaiNextToken = Nothing
    }
{-# INLINE listPlatformApplications #-}

data ListPlatformApplications = ListPlatformApplications
    { _lpaiNextToken :: Maybe Text
      -- ^ NextToken string is used when calling ListPlatformApplications
      -- action to retrieve additional records that are available after
      -- the first page results.
    } deriving (Show, Generic)

-- | NextToken string is used when calling ListPlatformApplications action to
-- retrieve additional records that are available after the first page
-- results.
lpaiNextToken :: Lens' ListPlatformApplications (Maybe Text)
lpaiNextToken f x =
    f (_lpaiNextToken x)
        <&> \y -> x { _lpaiNextToken = y }
{-# INLINE lpaiNextToken #-}

instance ToQuery ListPlatformApplications where
    toQuery = genericQuery def

data ListPlatformApplicationsResponse = ListPlatformApplicationsResponse
    { _lparPlatformApplications :: [PlatformApplication]
      -- ^ Platform applications returned when calling
      -- ListPlatformApplications action.
    , _lparNextToken :: Maybe Text
      -- ^ NextToken string is returned when calling
      -- ListPlatformApplications action if additional records are
      -- available after the first page results.
    } deriving (Show, Generic)

-- | Platform applications returned when calling ListPlatformApplications
-- action.
lparPlatformApplications :: Lens' ListPlatformApplicationsResponse ([PlatformApplication])
lparPlatformApplications f x =
    f (_lparPlatformApplications x)
        <&> \y -> x { _lparPlatformApplications = y }
{-# INLINE lparPlatformApplications #-}

-- | NextToken string is returned when calling ListPlatformApplications action
-- if additional records are available after the first page results.
lparNextToken :: Lens' ListPlatformApplicationsResponse (Maybe Text)
lparNextToken f x =
    f (_lparNextToken x)
        <&> \y -> x { _lparNextToken = y }
{-# INLINE lparNextToken #-}

instance FromXML ListPlatformApplicationsResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest ListPlatformApplications where
    type Sv ListPlatformApplications = SNS
    type Rs ListPlatformApplications = ListPlatformApplicationsResponse

    request = post "ListPlatformApplications"
    response _ = xmlResponse

instance AWSPager ListPlatformApplications where
    next rq rs = (\x -> rq { _lpaiNextToken = Just x })
        <$> (_lparNextToken rs)
