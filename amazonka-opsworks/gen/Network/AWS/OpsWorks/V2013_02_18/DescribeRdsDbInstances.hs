{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.OpsWorks.V2013_02_18.DescribeRdsDbInstances
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Describes Amazon RDS instances.
module Network.AWS.OpsWorks.V2013_02_18.DescribeRdsDbInstances
    (
    -- * Request
      DescribeRdsDbInstances
    -- ** Request constructor
    , describeRdsDbInstances
    -- ** Request lenses
    , drdisStackId
    , drdisRdsDbInstanceArns

    -- * Response
    , DescribeRdsDbInstancesResponse
    -- ** Response lenses
    , drditRdsDbInstances
    ) where

import           Network.AWS.OpsWorks.V2013_02_18.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

-- | Minimum specification for a 'DescribeRdsDbInstances' request.
describeRdsDbInstances :: Text -- ^ 'drdisStackId'
                       -> DescribeRdsDbInstances
describeRdsDbInstances p1 = DescribeRdsDbInstances
    { _drdisStackId = p1
    , _drdisRdsDbInstanceArns = mempty
    }
{-# INLINE describeRdsDbInstances #-}

data DescribeRdsDbInstances = DescribeRdsDbInstances
    { _drdisStackId :: Text
      -- ^ The stack ID that the instances are registered with. The
      -- operation returns descriptions of all registered Amazon RDS
      -- instances.
    , _drdisRdsDbInstanceArns :: [Text]
      -- ^ An array containing the ARNs of the instances to be described.
    } deriving (Show, Generic)

-- | The stack ID that the instances are registered with. The operation returns
-- descriptions of all registered Amazon RDS instances.
drdisStackId :: Lens' DescribeRdsDbInstances (Text)
drdisStackId f x =
    f (_drdisStackId x)
        <&> \y -> x { _drdisStackId = y }
{-# INLINE drdisStackId #-}

-- | An array containing the ARNs of the instances to be described.
drdisRdsDbInstanceArns :: Lens' DescribeRdsDbInstances ([Text])
drdisRdsDbInstanceArns f x =
    f (_drdisRdsDbInstanceArns x)
        <&> \y -> x { _drdisRdsDbInstanceArns = y }
{-# INLINE drdisRdsDbInstanceArns #-}

instance ToPath DescribeRdsDbInstances

instance ToQuery DescribeRdsDbInstances

instance ToHeaders DescribeRdsDbInstances

instance ToJSON DescribeRdsDbInstances

data DescribeRdsDbInstancesResponse = DescribeRdsDbInstancesResponse
    { _drditRdsDbInstances :: [RdsDbInstance]
      -- ^ An a array of RdsDbInstance objects that describe the instances.
    } deriving (Show, Generic)

-- | An a array of RdsDbInstance objects that describe the instances.
drditRdsDbInstances :: Lens' DescribeRdsDbInstancesResponse ([RdsDbInstance])
drditRdsDbInstances f x =
    f (_drditRdsDbInstances x)
        <&> \y -> x { _drditRdsDbInstances = y }
{-# INLINE drditRdsDbInstances #-}

instance FromJSON DescribeRdsDbInstancesResponse

instance AWSRequest DescribeRdsDbInstances where
    type Sv DescribeRdsDbInstances = OpsWorks
    type Rs DescribeRdsDbInstances = DescribeRdsDbInstancesResponse

    request = get
    response _ = jsonResponse
