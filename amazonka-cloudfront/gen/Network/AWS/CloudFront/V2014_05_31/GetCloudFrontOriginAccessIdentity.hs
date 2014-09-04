{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.CloudFront.V2014_05_31.GetCloudFrontOriginAccessIdentity
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Get the information about an origin access identity.
module Network.AWS.CloudFront.V2014_05_31.GetCloudFrontOriginAccessIdentity
    (
    -- * Request
      GetCloudFrontOriginAccessIdentity
    -- ** Request constructor
    , getCloudFrontOriginAccessIdentity
    -- ** Request lenses
    , gcfoairId

    -- * Response
    , GetCloudFrontOriginAccessIdentityResponse
    -- ** Response lenses
    , gcfoaisCloudFrontOriginAccessIdentity
    , gcfoaisETag
    ) where

import Network.AWS.Request.RestXML
import Network.AWS.CloudFront.V2014_05_31.Types
import Network.AWS.Prelude

-- | Minimum specification for a 'GetCloudFrontOriginAccessIdentity' request.
getCloudFrontOriginAccessIdentity :: Text -- ^ 'gcfoairId'
                                  -> GetCloudFrontOriginAccessIdentity
getCloudFrontOriginAccessIdentity p1 = GetCloudFrontOriginAccessIdentity
    { _gcfoairId = p1
    }
{-# INLINE getCloudFrontOriginAccessIdentity #-}

data GetCloudFrontOriginAccessIdentity = GetCloudFrontOriginAccessIdentity
    { _gcfoairId :: Text
      -- ^ The identity's id.
    } deriving (Show, Generic)

-- | The identity's id.
gcfoairId :: Lens' GetCloudFrontOriginAccessIdentity (Text)
gcfoairId f x =
    f (_gcfoairId x)
        <&> \y -> x { _gcfoairId = y }
{-# INLINE gcfoairId #-}

instance ToPath GetCloudFrontOriginAccessIdentity where
    toPath GetCloudFrontOriginAccessIdentity{..} = mconcat
        [ "/2014-05-31/origin-access-identity/cloudfront/"
        , toBS _gcfoairId
        ]

instance ToQuery GetCloudFrontOriginAccessIdentity

instance ToHeaders GetCloudFrontOriginAccessIdentity

instance ToXML GetCloudFrontOriginAccessIdentity where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "GetCloudFrontOriginAccessIdentityRequest"

data GetCloudFrontOriginAccessIdentityResponse = GetCloudFrontOriginAccessIdentityResponse
    { _gcfoaisCloudFrontOriginAccessIdentity :: Maybe CloudFrontOriginAccessIdentity
      -- ^ The origin access identity's information.
    , _gcfoaisETag :: Maybe Text
      -- ^ The current version of the origin access identity's information.
      -- For example: E2QWRUHAPOMQZL.
    } deriving (Show, Generic)

-- | The origin access identity's information.
gcfoaisCloudFrontOriginAccessIdentity :: Lens' GetCloudFrontOriginAccessIdentityResponse (Maybe CloudFrontOriginAccessIdentity)
gcfoaisCloudFrontOriginAccessIdentity f x =
    f (_gcfoaisCloudFrontOriginAccessIdentity x)
        <&> \y -> x { _gcfoaisCloudFrontOriginAccessIdentity = y }
{-# INLINE gcfoaisCloudFrontOriginAccessIdentity #-}

-- | The current version of the origin access identity's information. For
-- example: E2QWRUHAPOMQZL.
gcfoaisETag :: Lens' GetCloudFrontOriginAccessIdentityResponse (Maybe Text)
gcfoaisETag f x =
    f (_gcfoaisETag x)
        <&> \y -> x { _gcfoaisETag = y }
{-# INLINE gcfoaisETag #-}

instance AWSRequest GetCloudFrontOriginAccessIdentity where
    type Sv GetCloudFrontOriginAccessIdentity = CloudFront
    type Rs GetCloudFrontOriginAccessIdentity = GetCloudFrontOriginAccessIdentityResponse

    request = get
    response _ = cursorResponse $ \hs xml ->
        pure GetCloudFrontOriginAccessIdentityResponse
            <*> xml %|? "CloudFrontOriginAccessIdentity"
            <*> hs ~:? "ETag"
