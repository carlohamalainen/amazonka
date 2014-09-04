{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.CloudFront.V2014_05_31.UpdateDistribution
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Update a distribution.
module Network.AWS.CloudFront.V2014_05_31.UpdateDistribution
    (
    -- * Request
      UpdateDistribution
    -- ** Request constructor
    , updateDistribution
    -- ** Request lenses
    , udrDistributionConfig
    , udrId
    , udrIfMatch

    -- * Response
    , UpdateDistributionResponse
    -- ** Response lenses
    , udsDistribution
    , udsETag
    ) where

import Network.AWS.Request.RestXML
import Network.AWS.CloudFront.V2014_05_31.Types
import Network.AWS.Prelude

-- | Minimum specification for a 'UpdateDistribution' request.
updateDistribution :: DistributionConfig -- ^ 'udrDistributionConfig'
                   -> Text -- ^ 'udrId'
                   -> UpdateDistribution
updateDistribution p1 p2 = UpdateDistribution
    { _udrDistributionConfig = p1
    , _udrId = p2
    , _udrIfMatch = Nothing
    }
{-# INLINE updateDistribution #-}

data UpdateDistribution = UpdateDistribution
    { _udrDistributionConfig :: DistributionConfig
      -- ^ The distribution's configuration information.
    , _udrId :: Text
      -- ^ The distribution's id.
    , _udrIfMatch :: Maybe Text
      -- ^ The value of the ETag header you received when retrieving the
      -- distribution's configuration. For example: E2QWRUHAPOMQZL.
    } deriving (Show, Generic)

-- | The distribution's configuration information.
udrDistributionConfig :: Lens' UpdateDistribution (DistributionConfig)
udrDistributionConfig f x =
    f (_udrDistributionConfig x)
        <&> \y -> x { _udrDistributionConfig = y }
{-# INLINE udrDistributionConfig #-}

-- | The distribution's id.
udrId :: Lens' UpdateDistribution (Text)
udrId f x =
    f (_udrId x)
        <&> \y -> x { _udrId = y }
{-# INLINE udrId #-}

-- | The value of the ETag header you received when retrieving the
-- distribution's configuration. For example: E2QWRUHAPOMQZL.
udrIfMatch :: Lens' UpdateDistribution (Maybe Text)
udrIfMatch f x =
    f (_udrIfMatch x)
        <&> \y -> x { _udrIfMatch = y }
{-# INLINE udrIfMatch #-}

instance ToPath UpdateDistribution where
    toPath UpdateDistribution{..} = mconcat
        [ "/2014-05-31/distribution/"
        , toBS _udrId
        , "/config"
        ]

instance ToQuery UpdateDistribution

instance ToHeaders UpdateDistribution where
    toHeaders UpdateDistribution{..} = concat
        [ "If-Match" =: _udrIfMatch
        ]

instance ToXML UpdateDistribution where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "UpdateDistributionRequest"

data UpdateDistributionResponse = UpdateDistributionResponse
    { _udsDistribution :: Maybe Distribution
      -- ^ The distribution's information.
    , _udsETag :: Maybe Text
      -- ^ The current version of the configuration. For example:
      -- E2QWRUHAPOMQZL.
    } deriving (Show, Generic)

-- | The distribution's information.
udsDistribution :: Lens' UpdateDistributionResponse (Maybe Distribution)
udsDistribution f x =
    f (_udsDistribution x)
        <&> \y -> x { _udsDistribution = y }
{-# INLINE udsDistribution #-}

-- | The current version of the configuration. For example: E2QWRUHAPOMQZL.
udsETag :: Lens' UpdateDistributionResponse (Maybe Text)
udsETag f x =
    f (_udsETag x)
        <&> \y -> x { _udsETag = y }
{-# INLINE udsETag #-}

instance AWSRequest UpdateDistribution where
    type Sv UpdateDistribution = CloudFront
    type Rs UpdateDistribution = UpdateDistributionResponse

    request = put
    response _ = cursorResponse $ \hs xml ->
        pure UpdateDistributionResponse
            <*> xml %|? "Distribution"
            <*> hs ~:? "ETag"
