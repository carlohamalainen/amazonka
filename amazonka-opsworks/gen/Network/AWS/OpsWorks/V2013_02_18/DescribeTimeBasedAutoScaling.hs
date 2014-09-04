{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.OpsWorks.V2013_02_18.DescribeTimeBasedAutoScaling
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Describes time-based auto scaling configurations for specified instances.
-- You must specify at least one of the parameters. Required Permissions: To
-- use this action, an IAM user must have a Show, Deploy, or Manage
-- permissions level for the stack, or an attached policy that explicitly
-- grants permissions. For more information on user permissions, see Managing
-- User Permissions.
module Network.AWS.OpsWorks.V2013_02_18.DescribeTimeBasedAutoScaling
    (
    -- * Request
      DescribeTimeBasedAutoScaling
    -- ** Request constructor
    , describeTimeBasedAutoScaling
    -- ** Request lenses
    , dtbasrInstanceIds

    -- * Response
    , DescribeTimeBasedAutoScalingResponse
    -- ** Response lenses
    , dtbassTimeBasedAutoScalingConfigurations
    ) where

import           Network.AWS.OpsWorks.V2013_02_18.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

-- | Minimum specification for a 'DescribeTimeBasedAutoScaling' request.
describeTimeBasedAutoScaling :: [Text] -- ^ 'dtbasrInstanceIds'
                             -> DescribeTimeBasedAutoScaling
describeTimeBasedAutoScaling p1 = DescribeTimeBasedAutoScaling
    { _dtbasrInstanceIds = p1
    }
{-# INLINE describeTimeBasedAutoScaling #-}

data DescribeTimeBasedAutoScaling = DescribeTimeBasedAutoScaling
    { _dtbasrInstanceIds :: [Text]
      -- ^ An array of instance IDs.
    } deriving (Show, Generic)

-- | An array of instance IDs.
dtbasrInstanceIds :: Lens' DescribeTimeBasedAutoScaling ([Text])
dtbasrInstanceIds f x =
    f (_dtbasrInstanceIds x)
        <&> \y -> x { _dtbasrInstanceIds = y }
{-# INLINE dtbasrInstanceIds #-}

instance ToPath DescribeTimeBasedAutoScaling

instance ToQuery DescribeTimeBasedAutoScaling

instance ToHeaders DescribeTimeBasedAutoScaling

instance ToJSON DescribeTimeBasedAutoScaling

data DescribeTimeBasedAutoScalingResponse = DescribeTimeBasedAutoScalingResponse
    { _dtbassTimeBasedAutoScalingConfigurations :: [TimeBasedAutoScalingConfiguration]
      -- ^ An array of TimeBasedAutoScalingConfiguration objects that
      -- describe the configuration for the specified instances.
    } deriving (Show, Generic)

-- | An array of TimeBasedAutoScalingConfiguration objects that describe the
-- configuration for the specified instances.
dtbassTimeBasedAutoScalingConfigurations :: Lens' DescribeTimeBasedAutoScalingResponse ([TimeBasedAutoScalingConfiguration])
dtbassTimeBasedAutoScalingConfigurations f x =
    f (_dtbassTimeBasedAutoScalingConfigurations x)
        <&> \y -> x { _dtbassTimeBasedAutoScalingConfigurations = y }
{-# INLINE dtbassTimeBasedAutoScalingConfigurations #-}

instance FromJSON DescribeTimeBasedAutoScalingResponse

instance AWSRequest DescribeTimeBasedAutoScaling where
    type Sv DescribeTimeBasedAutoScaling = OpsWorks
    type Rs DescribeTimeBasedAutoScaling = DescribeTimeBasedAutoScalingResponse

    request = get
    response _ = jsonResponse
