{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.Redshift.V2012_12_01.RevokeSnapshotAccess
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Removes the ability of the specified AWS customer account to restore the
-- specified snapshot. If the account is currently restoring the snapshot, the
-- restore will run to completion. For more information about working with
-- snapshots, go to Amazon Redshift Snapshots in the Amazon Redshift
-- Management Guide.
module Network.AWS.Redshift.V2012_12_01.RevokeSnapshotAccess
    (
    -- * Request
      RevokeSnapshotAccess
    -- ** Request constructor
    , revokeSnapshotAccess
    -- ** Request lenses
    , rsamSnapshotIdentifier
    , rsamAccountWithRestoreAccess
    , rsamSnapshotClusterIdentifier

    -- * Response
    , RevokeSnapshotAccessResponse
    -- ** Response lenses
    , sssssssssssssssssssssssssssssssssssssrSnapshot
    ) where

import Network.AWS.Request.Query
import Network.AWS.Redshift.V2012_12_01.Types
import Network.AWS.Prelude

-- | Minimum specification for a 'RevokeSnapshotAccess' request.
revokeSnapshotAccess :: Text -- ^ 'rsamSnapshotIdentifier'
                     -> Text -- ^ 'rsamAccountWithRestoreAccess'
                     -> RevokeSnapshotAccess
revokeSnapshotAccess p1 p2 = RevokeSnapshotAccess
    { _rsamSnapshotIdentifier = p1
    , _rsamAccountWithRestoreAccess = p2
    , _rsamSnapshotClusterIdentifier = Nothing
    }
{-# INLINE revokeSnapshotAccess #-}

data RevokeSnapshotAccess = RevokeSnapshotAccess
    { _rsamSnapshotIdentifier :: Text
      -- ^ The identifier of the snapshot that the account can no longer
      -- access.
    , _rsamAccountWithRestoreAccess :: Text
      -- ^ The identifier of the AWS customer account that can no longer
      -- restore the specified snapshot.
    , _rsamSnapshotClusterIdentifier :: Maybe Text
      -- ^ The identifier of the cluster the snapshot was created from. This
      -- parameter is required if your IAM user has a policy containing a
      -- snapshot resource element that specifies anything other than *
      -- for the cluster name.
    } deriving (Show, Generic)

-- | The identifier of the snapshot that the account can no longer access.
rsamSnapshotIdentifier :: Lens' RevokeSnapshotAccess (Text)
rsamSnapshotIdentifier f x =
    f (_rsamSnapshotIdentifier x)
        <&> \y -> x { _rsamSnapshotIdentifier = y }
{-# INLINE rsamSnapshotIdentifier #-}

-- | The identifier of the AWS customer account that can no longer restore the
-- specified snapshot.
rsamAccountWithRestoreAccess :: Lens' RevokeSnapshotAccess (Text)
rsamAccountWithRestoreAccess f x =
    f (_rsamAccountWithRestoreAccess x)
        <&> \y -> x { _rsamAccountWithRestoreAccess = y }
{-# INLINE rsamAccountWithRestoreAccess #-}

-- | The identifier of the cluster the snapshot was created from. This parameter
-- is required if your IAM user has a policy containing a snapshot resource
-- element that specifies anything other than * for the cluster name.
rsamSnapshotClusterIdentifier :: Lens' RevokeSnapshotAccess (Maybe Text)
rsamSnapshotClusterIdentifier f x =
    f (_rsamSnapshotClusterIdentifier x)
        <&> \y -> x { _rsamSnapshotClusterIdentifier = y }
{-# INLINE rsamSnapshotClusterIdentifier #-}

instance ToQuery RevokeSnapshotAccess where
    toQuery = genericQuery def

data RevokeSnapshotAccessResponse = RevokeSnapshotAccessResponse
    { _sssssssssssssssssssssssssssssssssssssrSnapshot :: Maybe Snapshot
      -- ^ Describes a snapshot.
    } deriving (Show, Generic)

-- | Describes a snapshot.
sssssssssssssssssssssssssssssssssssssrSnapshot :: Lens' RevokeSnapshotAccessResponse (Maybe Snapshot)
sssssssssssssssssssssssssssssssssssssrSnapshot f x =
    f (_sssssssssssssssssssssssssssssssssssssrSnapshot x)
        <&> \y -> x { _sssssssssssssssssssssssssssssssssssssrSnapshot = y }
{-# INLINE sssssssssssssssssssssssssssssssssssssrSnapshot #-}

instance FromXML RevokeSnapshotAccessResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest RevokeSnapshotAccess where
    type Sv RevokeSnapshotAccess = Redshift
    type Rs RevokeSnapshotAccess = RevokeSnapshotAccessResponse

    request = post "RevokeSnapshotAccess"
    response _ = xmlResponse
